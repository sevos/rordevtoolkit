installation_unit "rubygems",
:description => "Update Rubygems in system" do |i|
  i.step "Install rubygems update in debian-way", :supported => :ubuntu do |s,i|
    s.gem.install "rubygems-update"
    s.surun "/var/lib/gems/1.8/bin/update_rubygems"
  end
  i.step "Install rubygems update", :supported => :fedora do |s,i|
    s.surun "gem update --system"
  end
  i.install_gem "rake"
end
