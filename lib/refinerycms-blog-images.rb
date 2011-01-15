require 'refinery'

module Refinery
  module Blog
    module Posts

      attr_accessor :tabs

      def self.tabs
        @tabs ||= []
      end

      class Tab
        attr_accessor :name, :partial

        def self.register(&block)
          tab = self.new

          yield tab

          raise "A tab MUST have a name!: #{tab.inspect}" if tab.name.blank?
          raise "A tab MUST have a partial!: #{tab.inspect}" if tab.partial.blank?
        end

      protected

        def initialize
          ::Refinery::Blog.tabs << self # add me to the collection of registered page tabs
        end
      end

    end
  end

  module BlogPostsImages
    class Engine < Rails::Engine
      initializer "static assets" do |app|
        app.middleware.insert_after ::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public"
      end

      config.to_prepare do
        BlogPost.module_eval do
          has_many :image_blog_posts
          has_many :images, :through => :image_blog_posts, :order => 'position ASC'
          # accepts_nested_attributes_for MUST come before def images_attributes=
          # this is because images_attributes= overrides accepts_nested_attributes_for.
          accepts_nested_attributes_for :images, :allow_destroy => false

          def images_attributes=(data)
            self.images.clear
            data.reject!{|i, d| d['id'].blank?}
            self.images += (0..(data.length-1)).collect { |i|
              (Image.find(data[i.to_s]['id'].to_i) rescue nil)
            }.compact
          end
        end
      end

      config.after_initialize do
        Refinery::Blog::Posts::Tab.register do |tab|
          tab.name = "images"
          tab.partial = "/admin/blog_posts/tabs/images"
        end
      end
    end
  end
end

