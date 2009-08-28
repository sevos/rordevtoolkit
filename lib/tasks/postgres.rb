namespace :postgres do
  
  desc "Pre-Configure PostgreSQL server"
  task :postgres_passwd do
    case distribution
      when :fedora 
        passwd_cmd = 'su -c "su -l postgres -c psql postgres"'
        usr = "Enter your root password"
      when :ubuntu 
        passwd_cmd = 'sudo -u postgres psql postgres'
        usr = "Enter your password if nessesary"
    end
    info "#{usr} and when you see"
    info "postgres=# prompt type:"
    info "\\passwd postgres"
    info "and then set postgres user password"
    info "it should be strong password"
    info "(postgres user has administrative privileges)"
    run passwd_cmd
  end

  desc "Enable local user access"
  task :enable_local_access do
    puts "*** \e[1;31mNot implemented yet\e[0m ***"
  end

  desc "Fedora: initialize cluster"
  task :create_cluster do
    if distribution == :fedora
      puts "*** \e[1;31mNot implemented yet\e[0m ***"
    else
      puts "*** \e[1;31mTask intended only for Fedora\e[0m ***"
    end
  end
end
