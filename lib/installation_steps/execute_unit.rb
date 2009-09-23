class ExecuteUnitInstallationStep < InstallationStep

  def initialize(name, type = :module)
    super("Execute unit -> #{type}:#{name}:install", nil) do |s, u|
      unit = @@INSTALLATION_UNITS[type.to_sym][name]
      unless unit.nil?
        unit.install
      else
        s.error "Cannot execute #{name} unit (#{type.to_s})"
      end
    end

    @unit_name = name
    @unit_type = type.to_sym
  end

  def description
    unit = @@INSTALLATION_UNITS[@unit_type][@unit_name]
    if unit.nil?
      plan = "\e[31m** Cannot find unit: #{name} (#{type})\e[0m"
    else
      plan = unit.plan
    end
    return super+"\n#{plan}"
  end
end

class InstallationUnit
  def execute_unit(*args)
    @steps << ExecuteUnitInstallationStep.new(*args)
  end
end
