DISTRIBUTIONS = {
  :fedora => {
    :check => {
      :file_exists => "/usr/bin/yum" 
    },
  },
  :ubuntu => {
    :check => {
      :file_exists => "/usr/bin/apt-get" 
    },
  }
}


