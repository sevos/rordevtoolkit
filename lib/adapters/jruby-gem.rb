require 'lib/shell.rb'

class JRubyGemAdapter < PackageManager
  include Shell

  def install(package_name)
    surun "jruby -S gem install #{package_name}"
  end

  def installed?(package_name)
    `jruby -S gem list | grep #{package_name}` != ""
  end

end
