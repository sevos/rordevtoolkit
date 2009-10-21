class EmergeAdapter < PackageManager
  include Shell

  def install
    surun "emerge -1av #{system_package_list @package_list}"
  end

  def self.supports
    :system_package if distribution == :gentoo
  end

end

