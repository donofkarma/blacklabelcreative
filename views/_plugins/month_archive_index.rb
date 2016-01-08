module Jekyll

  class ArchiveIndex < Page
    def initialize(site, base, dir, period, posts)
      @site = site
      @base = base
      @dir = dir
      @name = 'index.html'
      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'archive.html')
      self.data['period'] = period
      self.data['period_posts'] = posts
      self.data['title'] = "Archive for #{period["month_name"]} #{period["year"]}"
    end
  end

  class ArchiveGenerator < Generator
    safe true

    def generate(site)
      if site.layouts.key? 'archive'
        site.posts.group_by{ |c| {"month_name" => Date::MONTHNAMES[c.date.month], "month" => c.date.month, "year" => c.date.year} }.each do |period, posts|
          archive_dir = File.join('blog', period["year"].to_s(), "%02d" % period["month"].to_s())
          write_archive_index(site, archive_dir, period, posts)
        end
      end
    end
    def write_archive_index(site, dir, period, posts)
      index = ArchiveIndex.new(site, site.source, dir, period, posts)
      index.render(site.layouts, site.site_payload)
      index.write(site.dest)
      site.pages << index
    end
  end

end