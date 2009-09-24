installation_unit "devel_studio", :type => :meta,
:description => "RoR developer's studio" do |i|

  i.execute_unit "rubygems"
  i.install_gem "rails"
  i.install_gem "mongrel"
  i.install_gem "campistrano"
  i.install_gem "markaby"
  i.install_gem "haml"
  i.install_gem "ruby-debug"
  i.execute_unit "vim"
  i.execute_unit "postgres"

end
