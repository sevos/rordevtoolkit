namespace :firebird do
  namespace :gem do
    namespace :fireruby do
      desc "Build Fireruby"
      task :build do
        info "Downloading and building Fireruby"
        run "cd /tmp; git clone git://github.com/rowland/fb.git"
        run "cd /tmp/fb; gem build fb.gemspec"
      end

      desc "Install Fireruby"
      task :install => :build do
        info "Installing Fireruby"
        install_cmd = GemPackage.install_path Dir['/tmp/fb/fb*.gem'].first
        run "cd /tmp/fb; #{install_cmd}"
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
      task :install => :build do
        info "Installing fb_adapter"
        install_cmd = GemPackage.install_path Dir['/tmp/fb_adapter/pkg/fb*.gem'].first
        run "cd /tmp/fb_adapter; #{install_cmd}"
        run "rm -fr /tmp/fb_adapter"
      end
    end
  end

  desc "Install firebird-superserver and RoR adapters"
  task :all => ["install", "gem:fireruby:install", "gem:fb_adapter:install"]
end
   
   
   
   
   
   
