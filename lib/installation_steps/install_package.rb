require 'lib/package_manager'

PackageManager.supported_managers.each do |manager|
  classname = "#{manager.to_s.capitalize}InstallationStep"
  eval <<-END_RUBY
    class #{classname} < InstallationStep
      def initialize(unit, package_list)
        @manager = PackageManager.#{manager.to_s}(package_list)
        super @manager.description, unit do |s, u|
          @manager.install
        end
      end        
    end
  END_RUBY
  eval <<-END_RUBY
    class InstallationUnit
      def install_#{manager.to_s}(name, opts = {})
        if opts.empty? or [*(opts[:supported])].include? distribution
          @steps << (eval '#{classname}').new(self, name) 
        end
      end
    end
  END_RUBY
end
