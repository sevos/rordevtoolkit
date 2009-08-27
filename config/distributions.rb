DISTRIBUTIONS = {
  :fedora => {
    :check => {
      :file_exists => "/usr/bin/yum" 
    },
    :install_path => 'su -c "yum -y install +pkg_names+"',
    :gem_install_path => 'su -c "gem install +pkg_names+"'
  },
  :ubuntu => {
    :check => {
      :file_exists => "/usr/bin/apt-get" 
    },
    :install_path => 'sudo apt-get install +pkg_names+',
    :gem_install_path => 'sudo gem install +pkg_names+'
  }
}


