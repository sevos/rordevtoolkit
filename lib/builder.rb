require 'config/distributions.rb'
PACKAGES = YAML.load_file('config/packages.yml')
@@distribution = nil

class SoftwarePackage
  def self.install_path(file)
    DISTRIBUTIONS[distribution][:install_path].gsub('+pkg_names+', file)
  end
  def self.install_package(package)
    pkglist = PACKAGES["app"][package.to_s][distribution.to_s]
    install_path pkglist
  end
end

class GemPackage
  def self.install_path(file)
    DISTRIBUTIONS[distribution][:gem_install_path].gsub('+pkg_names+', file)
  end
  def self.install_package(package)
    pkglist = PACKAGES["gem"][package.to_s]
    install_path pkglist
  end
end

def pinstall(package)
  info "Instalowanie pakietu #{package.to_s}"
  run SoftwarePackage.install_package(package)
end

def ginstall(package)
  info "Instalowanie gemu #{package.to_s}"
  run GemPackage.install_package(package)
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
  puts "\e[32mWykonywanie: \e[34m#{cmd}\e[0m"
  system cmd
end

def home_path
  `echo -n $HOME`
end

def info(string)
  if not /WARNING/ =~ string
    color = "\e[32m"
  else
    color = "\e[1;31m"
  end
  puts "*** #{color}#{string}\e[0m ***"
end
