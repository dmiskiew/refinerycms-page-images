class CreateBlogImages < ActiveRecord::Migration

  def self.up
    create_table :image_blog_posts, :id => false do |t|
      t.integer :image_id
      t.integer :blog_post_id
      t.integer :position
    end

    add_index :image_pages, :image_id
    add_index :image_pages, :blog_post_id
  end

  def self.down
    drop_table :image_blog_posts
  end

end