# Alias Apache Generator for Posts/Pages.
#
# Generates redirect pages for posts with aliases set in the YAML Front Matter.
#
# Place the full path of the alias (place to redirect from) inside the
# destination post's YAML Front Matter. One or more aliases may be given.
#
# Example Post Configuration:
#
#   ---
#     layout: post
#     title: "How I Keep Limited Pressing Running"
#     alias: /post/6301645915/how-i-keep-limited-pressing-running/index.html
#   ---
#
# Example Post Configuration:
#
#   ---
#     layout: post
#     title: "How I Keep Limited Pressing Running"
#     alias: [/first-alias/index.html, /second-alias/index.html]
#   ---
# 
# Rename the existing ".htaccess" to "_htaccess" in your source/sites folder.
#
# Author: Jan Stevens
# Site: http://www.fritz-hut.com
# Plugin Source: https://github.com/JanStevens/jykell-apache-alias-generator
# PLugin License: MIT

module Jekyll

  class AliasApacheGenerator < Generator

    def generate(site)
      @site = site

      setup_htaccess
      process_posts
      process_pages
    end

    def setup_htaccess
      if File.exist?(File.join(@site.source, "_htaccess"))
        FileUtils.cp(File.join(@site.source, "_htaccess"), File.join(@site.dest, ".htaccess"))
      end
      if File.exist?(File.join(@site.dest, ".htaccess"))
        FileUtils.rm(File.join(@site.dest, ".htaccess"))
      end
      File.open(File.join(@site.dest, ".htaccess"), 'a') do |file|
          file.write(alias_header())
      end
    end

    def process_posts
      @site.posts.each do |post|
        generate_aliases(post.url, post.data['alias'])
      end
    end

    def process_pages
      @site.pages.each do |page|
        generate_aliases(page.destination('').gsub(/index\.(html|htm)$/, ''), page.data['alias'])
      end
    end

    def generate_aliases(destination_path, aliases)
      alias_paths ||= Array.new
      alias_paths << aliases
      alias_paths.compact!

      alias_paths.flatten.each do |alias_path|
        alias_path = alias_path.to_s

        File.open(File.join(@site.dest, ".htaccess"), 'a') do |file|
          file.write(alias_template(alias_path, destination_path))
        end
        @site.static_files << Jekyll::AliasFile.new(@site, @site.dest, ".htaccess", '')
      end
    end

    def alias_template(alias_path, destination_path)
        "Redirect 301 #{alias_path} #{destination_path} \n"
    end

    def alias_header()
      "\n\n# ------------------------------------------------------------------------------\n"\
      "# | Alias Plugin Redirects                                                     |\n"\
      "# ------------------------------------------------------------------------------\n\n"
    end
  end

  class AliasFile < StaticFile
    require 'set'

    def destination(dest)
      File.join(dest, @dir)
    end

    def modified?
      return false
    end

    def write(dest)
      return true
    end
  end
end
