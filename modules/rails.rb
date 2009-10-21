installation_unit "rails",
:description => "Install Rails and some useful gems (mongrel, haml, etc.)" do |i|
  i.install_gem "rails"
  i.install_gem "mongrel"
  i.install_gem "capistrano"
  i.install_gem "markaby"
  i.install_gem "haml"
  i.install_gem "ruby-debug"
end
