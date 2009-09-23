require 'lib/shell.rb'

class GemAdapter < PackageManager
  include Shell

  def install(package_name)
    surun "gem install #{package_name}"
  end

  def installed?(package_name)
    `gem list | grep #{package_name}` != ""
  end

end
