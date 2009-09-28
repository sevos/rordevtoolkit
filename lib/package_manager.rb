class PackageManager

  @@childs = []
  @@supported = {}

  def initialize(package_list)
    @package_list = package_list
  end

  def install
    raise "Not implemented"
  end

  def installed?
    puts "warning: installed? not implemented! assumming false"
    return false
  end

  def description
    "Install #{@package_list}"
  end

  # def self.supports
  #   false
  # end

  def self.inherited(klass)
    @@childs << klass
  end

  def self.supported_managers
    initialize_managers
    @@supported.keys
  end

  protected

  def system_package_list(metapackage)
    packages = metapackage.split
    return metapackage if packages.size > 1

    if package_config = PACKAGES[packages.first]
      if pkg_list = package_config[distribution]
        return pkg_list.join
      end
    end
    return metapackage
  end

  private

  # looks trough all classes inheriting PackageManager class
  # picks only supported in current distribution
  # and creates according InstallationSteps for them
  def self.initialize_managers
    @@childs.reject! { |c| !c.supports }
    @@childs.each { |c| @@supported[c.supports] = c }
    class << self
      def self.supported_managers
        @@supported.keys
      end
    end
    @@supported.keys.each do |t|
      instance_eval <<-END
        def #{t.to_s}(package_list)
          (@@supported[:#{t.to_s}]).new(package_list)
        end
      END
      # InstallationStep.instance_eval <<-END
      #   def #{t.to_s}(package_list)
      #     PackageManager.#{t.to_s}(package_list)
      #   end
      # END
    end
  end

end

Dir['./lib/adapters/*.rb'].each  do |path|
  require "#{path}"
end

