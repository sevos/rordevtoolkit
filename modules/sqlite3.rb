installation_unit "sqlite3",
:description => "Install Sqlite3 server and Ruby&Rails adapters" do |i|
  i.install_system_package "sqlite3"
  i.install_gem "sqlite3-ruby"
end

