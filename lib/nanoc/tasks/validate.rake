# encoding: utf-8

namespace :validate do

  desc 'Validate the site’s HTML files'
  task :html do
    Nanoc::CLI.run %w( validate_html )
  end

  desc 'Validate the site’s CSS files'
  task :css do
    begin
      require 'w3c_validators'
      Nanoc::CLI.run %w( check css )
    rescue LoadError
      abort "To check CSS, you must either add to your Gemfile or 'gem install w3c_validators'."
    end
  end

  namespace :links do

    desc 'Validate the site’s internal links'
    task :internal do
      Nanoc::CLI.run %w( check internal_links)
    end

    desc 'Validate the site’s external links'
    task :external do
      Nanoc::CLI.run %w( check external_links )
    end

  end

  desc 'Validate the site’s internal and external links'
  task :links => [ 'links:internal', 'links:external' ]

end

desc 'Validate the site with all checks.'
task :validate => [ 'validate:css', 'validate:links' ]
