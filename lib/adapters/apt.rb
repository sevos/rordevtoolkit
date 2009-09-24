require 'lib/shell.rb'

class AptAdapter < PackageManager
  include Shell

  def install(package_name)
    surun "apt-get -y install #{package_name}"
  end

end
