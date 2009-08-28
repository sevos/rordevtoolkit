DISTRIBUTIONS = {
  :fedora => {
    :check => {
      :file_exists => "/usr/bin/yum" 
    },
    :install_path => 'yum -yq install +pkg_names+',
    :gem_install_path => 'gem install +pkg_names+',
    :admin_notify => "Enter your root password below",
    :admin_cmd => 'su -c "+cmd+"'
  },
  :ubuntu => {
    :check => {
      :file_exists => "/usr/bin/apt-get" 
    },
    :install_path => 'apt-get install +pkg_names+',
    :gem_install_path => 'gem install +pkg_names+',
    :admin_notify => "Sometimes you need enter your user password here",
    :admin_cmd => 'sudo /bin/sh -c "+cmd+"'
  }
}


