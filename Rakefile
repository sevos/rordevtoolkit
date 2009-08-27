require 'lib/builder.rb'

namespace :app do
  PACKAGES["app"].each do |package, options|
    namespace package.to_sym do
      if options.keys.member?(distribution.to_s)
        desc "Install #{options['desc']}"
        task :install  do
          pinstall package.to_sym
        end
      end
    end
  end
  
  namespace :vim do
    namespace :plugins do
      desc "Unpack VIM plugins and install into home directory"
      task :install do
        # sprawdzanie, czy katalog #{home_path}/.vim istnieje
        if File.exists? "#{home_path}/.vim"
          # katalog istnieje, trzeba go gdzieś skopiować
          info "#{home_path}/.vim directory exists, making backup in #{home_path}/.vim.bak"
          run "rm -fr #{home_path}/.vim.bak" if File.exists? "#{home_path}/.vim.bak"
          run "mv #{home_path}/.vim #{home_path}/.vim.bak"
        end
        run "cp -r files/vim/vimfiles #{home_path}/.vim"
      end
    end

    desc "Install default config into home directory"
    task :copy_config do
      if File.exists? "#{home_path}/.vimrc"
        info "#{home_path}/.vimrc file exists, making backup in #{home_path}/.vimrc.bak"
        run "rm -fr #{home_path}/.vimrc.bak" if File.exists? "#{home_path}/.vimrc.bak"
        run "mv #{home_path}/.vimrc #{home_path}/.vimrc.bak"
      end
      run "cp -r files/vim/vimrc #{home_path}/.vimrc"
    end
    
    desc "Install ViM, plugins and config file"
    task :all => ["app:vim:install", "app:vim:plugins:install", "app:vim:copy_config"]
  end

end

namespace :gems do
  PACKAGES["gems"].each do |package, gems|
    namespace package.to_sym do
      desc "Install gem and related gems: #{package}"
      task :install do
        puts gems
      end
    end
  end
end


task :default => ["vim:install", "ruby:install"]
