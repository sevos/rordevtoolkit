
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




