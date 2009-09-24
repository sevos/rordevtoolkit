class SystemPackageInstallationStep < InstallationStep

  def initialize(unit, package_list)

    super("Install #{package_list.join(", ")} into system", unit) do |s, u|
      s.system.install package_list.join(' ')
    end

  end

end

class InstallationUnit
  def install_system_package(package)
    pkglist = (PACKAGES[package.to_s][distribution.to_s] rescue package).split(' ')
    @steps << SystemPackageInstallationStep.new(self, pkglist)
  end
end
