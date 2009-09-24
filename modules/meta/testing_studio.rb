installation_unit "testing_studio", :type => :meta,
:description => "Rails application testing tools" do |i|

  i.install_system_package "libxslt1"
  i.install_system_package "libxml2"
  i.install_gem "rspec rspec-rails ZenTest"
  i.install_gem "cucumber webrat"
  i.execute_unit "sun_jre"
  i.execute_unit "jruby"
  i.install_jgem "celerity -v 0.0.6"
  i.install_gem "langalex-culerity --source http://gems.github.com"

end
