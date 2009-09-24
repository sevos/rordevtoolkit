class JRubyGemInstallationStep < InstallationStep

  def initialize(unit, package_name)

    super("Install #{package_name} gem into JRuby installation", unit) do |s, u|
      s.jgem.install package_name
    end

  end

end

class InstallationUnit
  def install_jgem(*args)
    @steps << JRubyGemInstallationStep.new(self, *args)
  end
end
