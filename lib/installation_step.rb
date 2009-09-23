class InstallationStep

  attr_reader :description

  def initialize(description, unit, &block)
    @description = description
    @unit = unit
    # create execute method
    class << self
      define_method :execute do
        info @description
        yield self, @unit
      end
    end

  end

  def warning(message)
    puts "\e[33m** #{message}\e[0m"
  end

  def info(message)
    puts "\e[32m** #{message}\e[0m"
  end
end
