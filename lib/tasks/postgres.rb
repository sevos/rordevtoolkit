namespace :postgres do
  
  all_tasks = [:install, :passwd, :repair_sources, :enable_local_access, :gem_install]
  
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
    puts "*** \e[1;31mYou need to manually edit #{find_pg_hba_conf}\e[0m ***"
    puts "*** \e[1;31mEnabling local access is not implemented yet\e[0m ***"
  end

  desc "Apply patch to postgresql client sources"
  task :repair_sources do
    sufind("libpq-fe.h", ["/usr/include"]).each do |file_path|
      info "Patching #{file_path}"
      surun "patch -Ns #{file_path} files/postgres/libpq-fe.h.patch"  
    end
  end

  

  
  if distribution == :fedora
    desc "Fedora: initialize cluster"
    task :create_cluster do
      info "Initializing database cluster"  
      surun "#{Dir["/etc/init.d/postgres*"].first} initdb"
    end
    all_tasks.insert(1, :create_cluster)
  end


  desc "Install and configure PostgreSQL server"
  task :all => all_tasks

end

def find_pg_hba_conf
  sufind("pg_hba.conf", ['/etc', '/var']).first
end

