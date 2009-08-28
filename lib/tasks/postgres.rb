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
    puts "*** \e[1;31mNot implemented yet\e[0m ***"
  end


  all_tasks = [:install, :passwd, :enable_local_access]

  if distribution == :fedora
    desc "Fedora: initialize cluster"
    task :create_cluster do
        puts "*** \e[1;31mNot implemented yet\e[0m ***"
    end
    all_tasks.insert(2, :create_cluster)
  end

    desc "Install and configure PostgreSQL server"
    task :all => all_tasks

end
