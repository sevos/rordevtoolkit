class PackageManager
  def install(package_name)
    raise "Not implemented"
  end

  def installed?(package_name)
    puts "warning: installed? not implemented! assuming false"
    return false
  end

  def supported?
    raise "Supported for #{self.class.name} not implemented"
  end
end

Dir['./lib/adapters/*.rb'].each  do |path|
  require "#{path}"
end

