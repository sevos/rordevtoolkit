namespace :vim do
  namespace :plugins do
    desc "Unpack VIM plugins and install into home directory"
    task :install do
      info "Installing ViM plugins"
      # sprawdzanie, czy katalog #{home_path}/.vim istnieje
      if File.exists? "#{home_path}/.vim"
        # katalog istnieje, trzeba go gdzieś skopiować
        info "WARNING: #{home_path}/.vim directory exists, making backup in #{home_path}/.vim.bak"
        run "rm -fr #{home_path}/.vim.bak" if File.exists? "#{home_path}/.vim.bak"
        run "mv #{home_path}/.vim #{home_path}/.vim.bak"
      end
      run "cp -r files/vim/vimfiles #{home_path}/.vim"
    end
  end

  desc "Install default config into home directory"
  task :copy_config do
    info "Installing ViM configuration file"
    if File.exists? "#{home_path}/.vimrc"
      info "WARNING: #{home_path}/.vimrcg file exists, making backup in #{home_path}/.vimrc.bak"
      run "rm -fr #{home_path}/.vimrc.bak" if File.exists? "#{home_path}/.vimrc.bak"
      run "mv #{home_path}/.vimrc #{home_path}/.vimrc.bak"
    end
    run "cp -r files/vim/vimrc #{home_path}/.vimrc"
  end
  
  desc "Install ViM, plugins and config file"
  task :all => [:install, "plugins:install", :copy_config, "vim:gem_install"]
end

