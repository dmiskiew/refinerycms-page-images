class ImageBlogPost < ActiveRecord::Base
  
  belongs_to :image
  belongs_to :blog_post

  before_save do |image_blog_post|
    image_blog_post.position = (ImageBlogPost.maximum(:position) || -1) + 1
  end

end