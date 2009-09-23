require 'find'
require 'lib/installation_unit'


# initialize installation units
Dir['./modules/**/*.rb'].each  do |path|
  require "#{path}"
end

# create rake tasks
@@INSTALLATION_UNITS.each do |type, units|
  units.each do |name, unit|
    namespace type do
      namespace name.to_sym do
        unless unit.description.blank?
          desc "Install #{unit.description}"
        else
          desc "Install #{name}"
        end
        task :install do
          unit.install
        end
        
        desc "Plan of #{type}:#{name}:install"
        task :plan do
          unit.plan
        end
      end
    end
  end
end

