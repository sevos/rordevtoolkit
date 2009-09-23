namespace :cucumber do
  
  desc "Install libraries required by cucumber"
  task :lib_install => ["libxslt1:install", "libxml2:install"]

  desc "Install cucumber with required systtem libraries"
  task :all => [:lib_install, :gem_install]

end
