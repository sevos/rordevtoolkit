require 'lib/shell.rb'

class YumAdapter < PackageManager
  include Shell

  def install(package_name)
    puts "\e[31mEnter your root password below\e[0m"
    surun "yum -yq install #{package_name}"
  end

end
