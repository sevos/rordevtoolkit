require 'lib/shell.rb'

class GemAdapter < PackageManager
  include Shell

  def initialize(package_list)
    super(package_list)
    @params = []  
    ['--no-ri', '--no-rdoc'] .each do |param|
     @params << param if rdt_options.include? param  
    end
  end

  def install
    surun "gem install #{@package_list} #{@params.join(' ')}"
  end

  def description
    "Install #{@package_list} into gems"
  end

  # def installed?
  #   `gem list | grep #{@package_}` != ""
  # end

  def self.supports
    :gem
  end

end
