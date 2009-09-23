namespace :firebird do
  # namespace :gem do
  namespace :fireruby do
    desc "Build Fireruby"
    task :build do
      info "Downloading and building Fireruby"
      run "cd /tmp; git clone git://github.com/rowland/fb.git"
      run "cd /tmp/fb; gem build fb.gemspec"
    end

    desc "Install Fireruby"
    task :gem_install => :build do
      info "Installing Fireruby"
      install_cmd = GemPackage.install_path Dir['/tmp/fb/fb*.gem'].first
      surun "cd /tmp/fb; #{install_cmd}"
      run "rm -fr /tmp/fb"
    end
  end

  namespace :fb_adapter do
    desc "Build AR Firebird adapter"
    task :build do
      info "Downloading and building fb_adapter"
      run "cd /tmp; git clone git://github.com/rowland/fb_adapter.git"
      run "cd /tmp/fb_adapter; rake gem"
    end
    desc "Install AR Firebird adapter"
    task :gem_install => :build do
      info "Installing fb_adapter"
      install_cmd = GemPackage.install_path Dir['/tmp/fb_adapter/pkg/fb*.gem'].first
      surun "cd /tmp/fb_adapter; #{install_cmd}"
      run "rm -fr /tmp/fb_adapter"
    end
  end
  
  if distribution == :ubuntu
    desc "dpkg-reconfigure firebird2.1-super"
    task :dpkg_reconfigure do
      surun "dpkg-reconfigure firebird2.1-super"
    end
  end

  all_tasks = ["install", "fireruby:gem_install", "fb_adapter:gem_install"]  

  all_tasks.insert(1, :dpkg_reconfigure) if distribution == :ubuntu

  desc "Install firebird-superserver and RoR adapters"
  task :all => all_tasks
end
   
   
   
   
   
   
