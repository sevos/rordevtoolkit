installation_unit "vim", :description => "Install GVim with plugins and gems" do |i|
  i.install_system_package "vim"
  i.execute_unit "vim-configuration"
  i.install_gem "vim-ruby"
end

installation_unit "vim-configuration", :description => "Install configuration for ViM dedicated to Rails-developers" do |i|
  i.step "Make a backup if nesessary" do|s,i|
    if File.exists? "#{home_path}/.vim"
      s.warning "WARNING: #{home_path}/.vim directory exists, making backup in #{home_path}/.vim.bak"
      s.run "rm -fr #{home_path}/.vim.bak" if File.exists? "#{home_path}/.vim.bak"
      s.run "mv #{home_path}/.vim #{home_path}/.vim.bak"
    end
    if File.exists? "#{home_path}/.vimrc"
      s.warning "WARNING: #{home_path}/.vimrcg file exists, making backup in #{home_path}/.vimrc.bak"
      s.run "rm -fr #{home_path}/.vimrc.bak" if File.exists? "#{home_path}/.vimrc.bak"
      s.run "mv #{home_path}/.vimrc #{home_path}/.vimrc.bak"
    end
  end
  i.step "Unpack plugins" do |s,i|
    s.run "tar xf files/vim/vimfiles.tar.gz -C #{home_path}"
  end
  i.step "Copy config file" do |s,i|
    s.run "cp files/vim/vimrc #{home_path}/.vimrc"
  end
end
