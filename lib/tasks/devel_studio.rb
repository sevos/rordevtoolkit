namespace :devel do
  namespace :meta_1 do
    desc "List installed packages"
    task :list do
      info "Will install following applications/gems"
      info "* VIM - GVim with plugins and configuration for RoR development"
      info "* PostgreSQL"
      info "* Rails - Ruby Web Framework"
      info "* Mongrel - Ruby web server"
      info "* Cucumber - testing framework"
      info "* Capistrano - deployment application"
      info "* Markaby - nice support for html-helpers (see railscasts.com)"
      info "* Haml - HAML/SASS support"
      info "* Ruby Debugger"
      # info "* "
      # info "* "
      # info "* "
      # info "* "
      # info "* "
      # info "* "
      # info "* "
    end

    desc "Install metapackage 1"
    task :install => ["vim:all", "postgres:all", "rails:gem_install",
                      "mongrel:gem_install", "cucumber:all", "capistrano:gem_install",
                      "markaby:gem_install", "haml:gem_install", 
                      "capistrano:gem_install", "ruby_debug:gem_install"]
  end
end
