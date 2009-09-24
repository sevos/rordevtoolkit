require "yaml"
require 'config/distributions.rb'
PACKAGES = YAML.load_file('config/packages.yml')
@@distribution = nil

class SoftwarePackage
  def self.install_path(file)
    file ||= ""
    DISTRIBUTIONS[distribution][:install_path].gsub('+pkg_names+', file)
  end
  def self.install_package_path(package)
    pkglist = PACKAGES["app"][package.to_s][distribution.to_s]
    install_path pkglist
  end
end

class GemPackage
  def self.install_path(file)
    DISTRIBUTIONS[distribution][:gem_install_path].gsub('+pkg_names+', file)
  end
  def self.install_package_path(package)
    pkglist = PACKAGES["gem"][package.to_s]

    # remove installed gems from list
    pkglist = pkglist.split(' ').reject {|pkg| installed? pkg}.join(' ')
    
    install_path pkglist unless pkglist.nil? or pkglist == ""
  end
  def self.installed?(gemname)
    if `gem list | grep "#{gemname.to_s}"` == ""
      false
    else
      true
    end
  end
end

def pinstall(package)
  info "Installing #{package.to_s}"
  surun SoftwarePackage.install_package_path(package)
end

def ginstall(package)
  info "Installing gem #{package.to_s}"
  path = GemPackage.install_package_path(package)
  surun path
end

def distribution
  if not @@distribution
    DISTRIBUTIONS.each do |dist, options|
      files_to_check = options[:check].collect do |check_type, options|
        options if check_type == :file_exists
      end
      dist if files_to_check.all? do |o|
        @@distribution = dist if File.exists? o
      end
    end
  end
  @@distribution
end

def run(cmd)
  if cmd
    puts "\e[32mExecuting: \e[34m#{cmd}\e[0m" 
    system cmd  
  end
end

def surun(cmd)
  if cmd
    info DISTRIBUTIONS[distribution][:admin_notify] if DISTRIBUTIONS[distribution][:admin_notify]
    run DISTRIBUTIONS[distribution][:admin_cmd].gsub('+cmd+', cmd)
  end
end

def home_path
  `echo -n $HOME`
end




class String
  def blank?
    if self.to_s == "" 
      return true
    else
      return false
    end
  end
end

class NilClass
  def blank?
    return true
  end
end
