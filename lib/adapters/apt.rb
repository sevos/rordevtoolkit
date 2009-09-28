require 'lib/shell.rb'

class AptAdapter < PackageManager
  include Shell

  def install
    surun "apt-get -y install #{system_package_list @package_list}"
  end

  def self.supports
    :system_package if distribution == :ubuntu
  end

end
