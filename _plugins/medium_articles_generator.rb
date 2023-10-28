# _plugins/medium_articles_generator.rb

require 'rss'
require 'open-uri'

module Jekyll
  class MediumArticlesGenerator < Generator
    safe true
    priority :high

    def generate(site)
      # Replace 'your-medium-username' with your actual Medium username
      medium_feed_url = "https://medium.com/feed/@ngnthilakshan"

      begin
        medium_feed = open(medium_feed_url)
        feed = RSS::Parser.parse(medium_feed)
      rescue StandardError => e
        warn "Error fetching or parsing Medium feed: #{e.message}"
        return
      end

      feed.items.each do |item|
        site.posts.docs << create_post(item)
      end
    end

    private

    def create_post(item)
      Post.new(site, site.source, '_posts', "#{item.pubDate.strftime('%Y-%m-%d')}-#{item.title.downcase.gsub(/[^\w]/, '-')}.md")
        .tap do |post|
          post.content = <<-CONTENT
---
layout: default
title: "#{item.title}"
---

#{item.description}
          CONTENT
          post.data['date'] = item.pubDate
          post.data['external_url'] = item.link
        end
    end
  end
end
