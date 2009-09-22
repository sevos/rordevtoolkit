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
      info "* RSpec & RSpec-RAILS ZenTest"
      info "* RCov"
      # info "* "
    end

    desc "Install testing studio metapackage"
    task :install => ["jruby:all", "celerity:gem_install", "cucumber:all", "culerity:gem_install"]
  end
end
