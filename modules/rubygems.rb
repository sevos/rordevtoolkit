installation_unit "rubygems",
:description => "Update Rubygems in system" do |i|

  i.install_gem "rubygems-update", :supported => :ubuntu
  i.step "Update rubygems in debian-way", :supported => :ubuntu do |s,i|
    s.surun "/var/lib/gems/1.8/bin/update_rubygems"
  end

  i.step "Install rubygems update", :supported => [:fedora, :gentoo] do |s,i|
    s.surun "gem update --system"
  end
  i.install_gem "rake"
end
