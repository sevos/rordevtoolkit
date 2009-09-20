namespace :jruby do
  TARBALL = "jruby-bin-1.3.1.tar.gz"


  desc "Download jRuby package"
  task :download do
    run "cd /tmp; wget http://dist.codehaus.org/jruby/1.3.1/#{TARBALL}"
  end

  desc "Install jRuby"
  task :install => "sun_jre:install" do
    if File.exists? "/tmp/#{TARBALL}"    
      surun "tar xf /tmp/#{TARBALL} -C /opt"
      surun "ln -s /opt/jruby-1.3.1 /opt/jruby"
      surun "echo 'export PATH=\\$PATH:/opt/jruby/bin' >> /root/.bash_profile"
      run "echo 'export PATH=\\$PATH:/opt/jruby/bin' >> ~/.bash_profile"
    else
      raise "Download tarball using jruby:download task first!"
    end
  end

  desc "Remove jRuby post-installation files"
  task :clean do
    run "rm /tmp/#{TARBALL}"
  end


  desc "Download and Install jRuby"
  task :all => [:download, :install, :clean]
end
