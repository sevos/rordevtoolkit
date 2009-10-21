installation_unit "devel_studio", :type => :meta,
:description => "RoR developer's studio" do |i|

  i.execute_unit "rubygems"
  i.execute_unit "rails"
  i.execute_unit "vim"
  i.execute_unit "postgres"

end
