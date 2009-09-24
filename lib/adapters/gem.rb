require 'lib/shell.rb'

class GemAdapter < PackageManager
  include Shell

  def initialize
    @params = []  
    ['--no-ri', '--no-rdoc'] .each do |param|
     @params << param if rdt_options.include? param  
    end
  end

  def install(package_name)
    surun "gem install #{package_name} #{@params.join(' ')}"
  end

  def installed?(package_name)
    `gem list | grep #{package_name}` != ""
  end

end
