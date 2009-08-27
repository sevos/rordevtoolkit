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
  end

  desc "Install firebird-superserver and RoR adapters"
  task :all => ["install", "gem:fireruby:install"]
end
   
   
   
   
   
   
