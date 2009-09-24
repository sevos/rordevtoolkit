require 'lib/shell.rb'
require 'lib/package_manager.rb'
class InstallationStep

  include Shell
  attr_reader :description

  def initialize(description, unit, &block)
    @description = description
    @unit = unit
    # create execute method
    class << self
      define_method :execute do
        info "#{@description.split("\n").first}"
        return yield self, @unit
      end
    end
  end

  def warning(message)
    puts "\e[33m**   #{message}\e[0m"
  end

  def info(message)
    puts "\e[32m**   #{message}\e[0m"
  end

  def error(message)
    puts "\e[31m**   #{message}\e[0m"
    raise message
  end

  def system
    d = distribution
    return AptAdapter.new if d == :ubuntu
    return YumAdapter.new if d == :fedora
    raise "RoRDevToolkit doesn't have system package support for your system!"
  end

  def gem
    return GemAdapter.new
  end

  def jgem
    return JRubyGemAdapter.new
  end

end


