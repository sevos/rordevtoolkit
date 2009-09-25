require 'lib/shell.rb'
require "lib/adapters/gem"
class JRubyGemAdapter < GemAdapter
  include Shell

  def install
    surun "jruby -S gem install #{@package_list} #{@params.join(' ')}"
  end

  def description
    "Install #{@package_list} into JRuby's gems"
  end

  # def installed?(package_name)
  #   `jruby -S gem list | grep #{package_name}` != ""
  # end

  def self.supports
    :jgem
  end

end
