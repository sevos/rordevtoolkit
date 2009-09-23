require 'lib/helpers'
require 'lib/installation_step'

@@INSTALLATION_UNITS = {
  :module  => {},
  :meta    => {},
  :program => {},
  :gem     => {},
  :jgem    => {}
}

class InstallationUnit
  attr_reader :name, :description

  def initialize(name, opts = {}, &block)
    @name = name
    @supported_distributions = [*(opts[:supported])].compact
    @type = opts[:type.to_sym] || :module
    @description = opts[:description] || ""
    
    @steps = [] 

    yield self

    # register unit on the list
    @@INSTALLATION_UNITS[@type][@name] = self if supported?
  end

  def install
    puts "\e[34m** Installing #{name}\e[0m"
    @steps.each { |s| s.execute }
    puts "\e[34m** DONE #{name}\e[0m"
  end

  def plan
    puts "\e[34m** Plan of #{@type}:#{name}:install\e[0m"
    @steps.each do |step|
      puts " - #{step.description}"
    end
  end

  
  def step(description, supported = @supported_distributions, &block)
    if supported.include?(distribution) || supported.nil? || supported.empty?
      @steps << InstallationStep.new(description, self, &block)
    end
  end

  def supported?
    return (@supported_distributions.include?(distribution) \
            or @supported_distributions.empty?)
  end
end

def installation_unit(*args, &block)
  InstallationUnit.new *(args), &block 
end


Dir['./lib/installation_steps/*.rb'].each  do |path|
  require "#{path}"
end
