
installation_unit "test", :type => :meta, 
:description => "Testing module" do |i|
 
  i.execute_unit "nothing", :module
  
  i.install_system_package "vim"
  i.install_system_package "mysql"
  i.install_gem "rake"
  i.install_jgem "celerity"

end
