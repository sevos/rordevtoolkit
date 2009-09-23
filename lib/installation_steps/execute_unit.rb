class ExecuteUnitInstallationStep < InstallationStep

  def initialize(name, type = :module)
    
    unit = @@INSTALLATION_UNITS[type.to_sym][name]
    if unit.nil?
      plan = "\e[31m** Cannot find unit: #{name} (#{type})\e[0m"
    else
      plan = unit.plan
    end
    super("Execute unit -> #{type}:#{name}:install\n#{plan}", nil) do |s, u|
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
