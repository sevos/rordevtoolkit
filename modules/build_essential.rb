installation_unit "build_essential", :description => "packages required to build native extensions" do |i|
  i.install_system_package "build-essential"
end
