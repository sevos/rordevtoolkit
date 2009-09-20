
namespace :celerity do
  desc "Install Celerity into jRuby installation"
  task :gem_install do
    surun "/opt/jruby/bin/jruby -S gem install celerity -v 0.0.6"
  end
end

namespace :culerity do
  desc "Install Culerity"
  task :gem_install do
    surun "gem install langalex-culerity --source http://gems.github.com"
  end
end

namespace :meta do
  namespace :testing_studio do
    desc "List packages included in metapackage"
    task :list do
      info "Will install following applications/gems"
      info "* JRuby"
      info "* JRuby/Celerity"
      info "* Cucumber"
      info "* Culerity"
      info "* Webrat"
      # info "* "
    end

    desc "Install testing studio metapackage"
    task :install => ["jruby:all", "celerity:gem_install", "cucumber:all", "culerity:gem_install"]
  end
end


