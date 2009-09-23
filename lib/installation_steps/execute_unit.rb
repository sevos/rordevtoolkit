class ExecuteUnitInstallationStep < InstallationStep

  def initialize(name, type = :module)

    super("Execute unit -> #{type}:#{name}:install\n   in order to see what it will do run:\n     rake #{type}:#{name}:plan", nil) do |s, u|
      unit = @@INSTALLATION_UNITS[type.to_sym][name]
      unless unit.nil?
        unit.install
      else
        s.error "Cannot execute #{name} unit (#{type.to_s})"
      end
    end

  end

end

class InstallationUnit
  def execute_unit(*args)
    @steps << ExecuteUnitInstallationStep.new(*args)
  end
end
