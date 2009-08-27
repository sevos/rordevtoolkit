require 'config/distributions.rb'
PACKAGES = YAML.load_file('config/packages.yml')

class SoftwarePackage
  @@distribution = nil

  def self.install(package)
    info "Instalowanie pakietu #{package.to_s}"
    run install_path(package)
  end
  
  def self.distribution
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

  def self.install_path(package)
    pkglist = PACKAGES["app"][package.to_s][distribution.to_s]
    DISTRIBUTIONS[self.distribution][:install_path].gsub('+pkg_names+', pkglist)
  end
end

def pinstall(package)
  SoftwarePackage.install(package)
end

def distribution
  SoftwarePackage.distribution
end

def run(cmd)
  puts "Wykonywanie: #{cmd}"
  system cmd
end

def home_path
  `echo -n $HOME`
end

def info(string)
  puts "*** #{string} ***"
end
