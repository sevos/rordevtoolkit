installation_unit "sun_jre", :supported => :fedora do |i|
  i.step "Information" do |s,i|
    s.warning "Installation Sun JRE in Fedora is not supported yet"
    s.warning "Please check if you have installed JRE externally"
    s.warning "And press Enter"
    s.pause
  end
end
installation_unit "sun_jre", :supported => :ubuntu do |i|
  i.install_system_package "sun-java6-jre"
end
