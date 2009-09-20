namespace :rubygems do

  task_list = [:update]
  
  if distribution == :ubuntu 
    desc "Prepare debian-like system to update rubygems"
    task :prepare do
      surun 'gem install rubygems-update'
      surun '/var/lib/gems/1.8/bin/update_rubygems'
    end
    task_list.insert 0, :prepare
  end

  desc "Update rubygems"
  task :update do
    surun 'gem update —system'
  end
  

  desc "Proceed all task in order to update rubygems"
  task :all => task_list
end
