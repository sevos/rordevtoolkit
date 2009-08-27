require 'lib/builder.rb'

namespace :app do
  PACKAGES["app"].each do |package, options|
    namespace package.to_sym do
      if options.keys.member?(distribution.to_s)
        desc "Install #{options['desc']}"
        task :install  do
          pinstall package.to_sym
        end
      end
    end
  end
end

namespace :gems do
  PACKAGES["gems"].each do |package, gems|
    namespace package.to_sym do
      desc "Install gem and related gems: #{package}"
      task :install do
        puts gems
      end
    end
  end
end

task :default => ["vim:install", "ruby:install"]
