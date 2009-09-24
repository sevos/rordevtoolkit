require "yaml"
require 'config/distributions.rb'
PACKAGES = YAML.load_file('config/packages.yml')
@@distribution = nil

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
def rdt_options
  @@rdt_opts = ENV["RDT_OPTS"].split(' ')
  def rdt_options
    @@rdt_opts
  end
  @@rdt_opts
end
