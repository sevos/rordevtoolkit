class GemInstallationStep < InstallationStep

  def initialize(unit, package_name)

    super("Install #{package_name} gem", unit) do |s, u|
      s.gem.install package_name
    end

  end

end

class InstallationUnit
  def install_gem(*args)
    @steps << GemInstallationStep.new(self, *args)
  end
end
