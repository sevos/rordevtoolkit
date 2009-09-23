
installation_unit "test2" do |i|
  i.step "Some things to do" do
    puts "Test!!!"
  end
end

installation_unit "test", :type => :meta, 
:description => "Testing module" do |i|
 
  i.execute_unit "test2", :module
  
  i.install_system_package "vim"
  i.install_system_package "mysql"
  i.install_gem "rake"
  i.install_jgem "celerity"

end

