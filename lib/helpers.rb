require "yaml"

module DistributionHelper
  PACKAGES = YAML.load_file('config/packages.yml')
  DISTRIBUTIONS = YAML.load_file('config/distributions.yml')
  @@distribution = nil

  def distribution
    if not @@distribution
      DISTRIBUTIONS.each do |dist, options|
        files_to_check = options["check"].collect do |check_type, options|
          options if check_type == "file_exists"
        end
        dist if files_to_check.all? do |o|
          @@distribution = dist.to_sym if File.exists? o
        end
      end
    end
    @@distribution
  end

  def home_path
    `echo -n $HOME`
  end

  def rdt_options
    @@rdt_opts = ENV["RDT_OPTS"].split(' ') rescue []
    def rdt_options
      @@rdt_opts
    end
    @@rdt_opts
  end
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
