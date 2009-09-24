installation_unit "vim", :description => "Install GVim with plugins and gems" do |i|
  i.install_system_package "vim"
  i.execute_unit "vim-configuration"
  i.install_gem "vim-ruby"
end

installation_unit "vim-configuration", :description => "Install configuration for ViM dedicated to Rails-developers" do |i|
  i.step "Make a backup if nesessary" do|s,i|
    if File.exists? "#{home_path}/.vim"
      s.warning "WARNING: #{home_path}/.vim directory exists, making backup in #{home_path}/.vim.bak"
      s.rm("#{home_path}/.vim.bak", :recursive => true) if File.exists? "#{home_path}/.vim.bak"
      s.run "mv #{home_path}/.vim #{home_path}/.vim.bak"
    end
    if File.exists? "#{home_path}/.vimrc"
      s.warning "WARNING: #{home_path}/.vimrc file exists, making backup in #{home_path}/.vimrc.bak"
      s.rm("#{home_path}/.vimrc.bak", :recursive => true) if File.exists? "#{home_path}/.vimrc.bak"
      s.run "mv #{home_path}/.vimrc #{home_path}/.vimrc.bak"
    end
  end

  i.step "Download newest akitaonrails/vimfiles" do |s,i|
    s.run "cd /tmp; git clone git://github.com/akitaonrails/vimfiles.git"
  end

  i.step "Download submodules of akitaonrails/vimfiles" do |s,i|
    s.run "cd /tmp/vimfiles; git submodule init"
    s.run "cd /tmp/vimfiles; git submodule update"
  end

  i.step "Install configuration in home directory" do |s,i|
    s.mv "/tmp/vimfiles", "#{home_path}/.vim"
    s.cp "files/vim/vimrc", "#{home_path}/.vimrc"
  end
end
