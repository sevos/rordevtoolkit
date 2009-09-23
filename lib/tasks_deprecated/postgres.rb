
namespace :postgres do
  
  all_tasks = [:install, :passwd, :enable_local_access, :gem_install]
  
  desc "Pre-Configure PostgreSQL server"
  task :passwd do
    
    info "When you see"
    info "postgres=# prompt type:"
    info "\e[1;31m\\password\e[33m"
    info "and then set postgres user password"
    info "it should be strong password"
    info "(postgres user has administrative privileges)"
    info "After that type \e[1;31m\\q\e[33m"
    server("restart")
    surun "su -l postgres -c psql postgres"
    server("restart")
  end

  desc "Enable local user access"
  task :enable_local_access do
    file_path = find_pg_hba_conf
    info "Patching #{file_path}"
    surun "patch -Ns #{file_path} files/postgres/pg_hba.conf.patch"  
    surun "chown postgres:postgres #{file_path}"
    server("restart")
  end

  # desc "Apply patch to postgresql client sources"
  # task :repair_sources do
  #   sufind("libpq-fe.h", ["/usr/include"]).each do |file_path|
  #     info "Patching #{file_path}"
  #     surun "patch -Ns #{file_path} files/postgres/libpq-fe.h.patch"  
  #   end
  # end

  

  
  if distribution == :fedora
    desc "Fedora: initialize cluster"
    task :create_cluster do
      info "Initializing database cluster"  
      server("initdb")
    end
    all_tasks.insert(1, :create_cluster)
  end


  desc "Install and configure PostgreSQL server"
  task :all => all_tasks

end

def find_pg_hba_conf
  sufind("pg_hba.conf", ['/etc', '/var']).first
end

@@pgrunscript = nil
def server(cmd)
  @@pgrunscript ||= sufind("*postgre*", ["/etc/init.d/"]).first
  unless @@pgrunscript.nil?
    surun "#{@@pgrunscript} #{cmd}"
  end
end

