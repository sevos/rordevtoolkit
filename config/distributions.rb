DISTRIBUTIONS = {
  :fedora => {
    :check => {
      :file_exists => { :dir => "/usr/bin", :name => "yum" }
    },

    :install_path => 'su -c "yum -y install +pkg_names+"',
    :gem_install_path => 'su -c "gem install +pkg_names+"'
  },
  :ubuntu => {
    :check => {
      :file_exists => { :dir => "/usr/bin", :name => "apt-get" }
    },
    :install_path => 'sudo apt-get install +pkg_names+',
    :gem_install_path => 'sudo gem install +pkg_names+'
  }
}


