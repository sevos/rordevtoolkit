installation_unit "postgres",
:description => "Instal PostgreSQL server and PGAdmin3" do |i|
  i.execute_unit "postgresql-server"
  i.install_system_package "pgadmin3"
end

installation_unit "postgresql-server",
:description => "Install PostgreSQL server and Ruby&Rails adapters" do |i|
  i.install_system_package "postgres"
  i.step "First start PostgreSQL server", :supported => :fedora do |s,i|
    s.surun "service postgresql initdb"
    s.surun "service postgresql start"
  end
  i.step "Run console to set default postgres password" do |s,i|
    s.info "When you see"
    s.info "postgres=# prompt type:"
    s.info "\e[1;31m\\password\e[33m"
    s.info "and then set postgres user password"
    s.info "it should be strong password"
    s.info "(postgres user has administrative privileges)"
    s.info "After that type \e[1;31m\\q\e[33m"
    s.surun "su -l postgres -c psql postgres"
  end
  i.step "Enable local access via username stored in database" do |s,i|
    hba_file = s.sufind("pg_hba.conf", ['/etc', '/var']).first
    s.info "Patching #{hba_file}"
    s.surun "patch -Ns #{hba_file} files/postgres/pg_hba.conf.patch"  
    s.surun "chown postgres:postgres #{hba_file}"
  end
  i.step "Restart server" do |s,i|
    sfile = s.sufind("*postgre*", ["/etc/init.d/"]).first
    s.surun "#{sfile} restart"
  end
end

