namespace :postgres do
  
  desc "Pre-Configure PostgreSQL server"
  task :passwd do
    
    info "When you see"
    info "postgres=# prompt type:"
    info "\\passwd postgres"
    info "and then set postgres user password"
    info "it should be strong password"
    info "(postgres user has administrative privileges)"
    surun "su -l postgres -c psql postgres"
  end

  desc "Enable local user access"
  task :enable_local_access do
    puts "*** \e[1;31mEnabling local access is not implemented yet\e[0m ***"
    puts "*** \e[1;31mYou need to edit #{find_pg_hba_conf}\e[0m ***"
  end


  all_tasks = [:install, :passwd, :enable_local_access]

  if distribution == :fedora
    desc "Fedora: initialize cluster"
    task :create_cluster do
      info "Initializing database cluster"  
      surun "#{Dir["/etc/init.d/postgres*"].first} initdb"
    end
    all_tasks.insert(2, :create_cluster)
  end

    desc "Install and configure PostgreSQL server"
    task :all => all_tasks

end

def find_pg_hba_conf
  cmd = "find /var /etc -name pg_hba.conf"
  cmd = DISTRIBUTIONS[distribution][:admin_cmd].gsub("+cmd+", cmd)
  info "Searching pg_hba.conf"
  info DISTRIBUTIONS[distribution][:admin_notify]
  result = `#{cmd}`
  result.split("\n").first
end
