require 'lib/shell.rb'

class JRubyGemAdapter < GemAdapter
  include Shell

  def install(package_name)
    surun "jruby -S gem install #{package_name} #{@params.join(' ')}"
  end

  def installed?(package_name)
    `jruby -S gem list | grep #{package_name}` != ""
  end

end
