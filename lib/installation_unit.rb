require 'lib/helpers'
require 'lib/installation_step'

@@INSTALLATION_UNITS = {
  :module  => {},
  :meta    => {},
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
    p = ""
      p += "\e[34m** Plan of #{@type}:#{name}:install\e[0m"
      @steps.each do |step|
        p += "\n - #{step.description}"
      end
      p += "\n\e[34m** End of plan of #{@type}:#{name}:install\e[0m"
    p
  end

  
  def step(description, opts = {}, &block)
    supported = opts[:supported] || @upported_distributions
    if [supported].include?(distribution) || supported.nil? || [supported].empty?
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
