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
      define_method "install_#{manager.to_s}" do |*args|
        opts = args[1] || {}
        if opts.empty? or opts[:supported] == distribution
          @steps << (eval '#{classname}').new(self, args[0]) 
        end
      end
    end
  END_RUBY
end
