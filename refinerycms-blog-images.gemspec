Gem::Specification.new do |s|
  s.name              = %q{refinerycms-blog-images}
  s.version           = %q{0.9.9.9}
  s.description       = %q{Blog Images Engine for Refinery CMS}
  s.date              = %q{2010-12-31}
  s.summary           = %q{Blog Images Engine for Refinery CMS}
  s.email             = %q{dave@resolvedigital.com}
  s.homepage          = %q{http://github.com/resolve/refinerycms-page-images}
  s.authors           = ['Resolve Digital', 'David Jones', 'Philip Arndt']
  s.require_paths     = %w(lib)

  s.add_dependency    'refinerycms', '>= 0.9.9'

  s.files             = [
    'app',
    'db',
    'lib',
    'public',
    'readme.md',
    'app/models',
    'app/models/image_blog_post.rb',
    'app/views',
    'app/views/admin',
    'app/views/admin/blogs',
    'app/views/admin/blogs/tabs',
    'app/views/admin/blogs/tabs/_images.html.erb',
    'db/migrate',
    'db/migrate/create_blog_images.rb',
    'lib/gemspec.rb',
    'lib/generators',
    'lib/generators/refinerycms_blog_post_images_generator.rb',
    'lib/refinerycms-blog-images.rb',
    'public/javascripts',
    'public/javascripts/blog-image-picker.js',
    'public/stylesheets',
    'public/stylesheets/blog-image-picker.css'
  ]
  
end
