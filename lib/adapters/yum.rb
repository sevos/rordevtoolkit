require 'lib/shell.rb'

class YumAdapter < PackageManager
  include Shell

  def install
    puts "\e[31mEnter your root password below\e[0m"
    surun "yum -yq install #{system_package_list @package_list}"
  end

  def self.supports
    :system_package if distribution == :fedora
  end
end
