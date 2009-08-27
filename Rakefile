require 'lib/builder.rb'
require 'find'

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

PACKAGES["gems"].each do |package, gems|
  namespace package.to_sym do
    namespace :gem do
      desc "Install gem and related gems: #{package}"
      task :install do
        puts gems
      end
    end
  end
end


Dir['./lib/tasks/**/*.rb'].each  do |path|
  require "#{path}"
end

task :default => ["vim:all", "ruby:install"]
