# Blog Images Engine for Refinery CMS

## About

Blog Images allows you to relate one or more images to any blog in Refinery which makes it really easy for you to create simple image galleries with lightbox style popups on the front end blog views.

## Requirements

* refinerycms >= 0.9.9

## Features

* Ability to select one or more images from the image picker and relate them to a blog
* Reordering support, simply drag into order

## Install

Add this line to your applications `Gemfile`

    gem 'refinerycms-blog-images', '~> 0.9.9'

Next run

    bundle install
    rails g refinerycms_blog_images
    rake db:migrate

Now when you start up your Refinery application, edit a blog and there should be a new "Images" tab.

If you get an error like

  uninitialized constant Refinery::Blogs::Tab

It means your Refinery version isn't new enough. To fix that you need to update the Refinery CMS `Gemfile` line to this

    gem 'refinerycms', :git => "git://github.com/resolve/refinerycms.git"

Then run:

    bundle install
    rake refinery:update

And then try again. Note that doing this will likely mean that you need to fix your application
for any changes that have happened since the version of Refinery CMS that you were using.

## Usage

`app/views/blogs/show.html.erb`

    <% content_for :body_content_right do %>
      <ul id='gallery'>
        <% @blog.images.each do |i| %>
          <li>
            <%= link_to image_tag(i.thumbnail("200x200#c").url), i.thumbnail("900x600").url %>
          </li>
        <% end %>
      </ul>
    <% end %>
    <%= render :partial => "/shared/content_blog" %>

## Screenshot

![Refinery CMS Blog Images Screenshot](http://refinerycms.com/system/images/0000/1736/refinerycms-blog-images.png)