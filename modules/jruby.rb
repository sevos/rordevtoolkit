installation_unit "jruby", 
:description => "Ruby working in JVM" do |i|
TARBALL= "jruby-bin-1.3.1.tar.gz"
  
  class << i
    attr_accessor :already_installed
  end

  i.step "Check if JRuby is installed" do |s,i|
    unless s.sufind("jruby", '/opt').empty?
      i.already_installed = true
      s.warning "Installation found in /opt/jruby - skipping next steps"
    else
      i.already_installed =false
    end
  end
  
  i.step "Download JRuby tarball" do |s,i|
    unless i.already_installed
      s.run "cd /tmp; wget http://dist.codehaus.org/jruby/1.3.1/#{TARBALL}"
    end
  end
  i.step "Install into /opt" do |s,i|
    unless i.already_installed
      if File.exists? "/tmp/#{TARBALL}"
        s.surun "tar xf /tmp/#{TARBALL} -C /opt"
        s.ln "/opt/jruby-1.3.1", "/opt/jruby", :root => true
        s.ln "/opt/jruby-1.3.1/bin/jruby", "/usr/bin/jruby", :root => true
      else
        s.error "Cannot find tarball file! Check Internet connection and\n" +\
          "rerun task"
      end
    end
  end
  i.step "Remove tarball" do |s,i|
    unless i.already_installed
      s.rm "/tmp/#{TARBALL}", :root => true
    end
  end
end
