module Shell
  
  def shell_su_commands 
    return {
      :ubuntu => 'sudo /bin/sh -c "+cmd+"',
      :fedora => 'su -c "+cmd+"'
    }
  end

  def run(cmd, catch_out = false)
    if catch_out
      return `#{cmd}`
    else
      Kernel.system(cmd)
    end
  end

  def surun(cmd, catch_out = false)
    return run(shell_su_commands[distribution].gsub('+cmd+',cmd), catch_out)
  end

  
  def sufind(file_pattern, dirs)
    cmd = "find #{[dirs].join(' ')} -name #{file_pattern}"
    result = surun(cmd, true)
    result.split("\n")
  end
  
  def pause
    run "sh -c 'read'" 
  end

  def ln(from, to, opts = {})
    cmd = "ln -s '#{from}' '#{to}'"
    if opts[:root]
      surun cmd
    else
      run cmd
    end
  end
  
  def rm(path, opts = {})
    if opts[:recursive]
      cmd = "rm -fr #{path}"
    else
      cmd = "rm -f #{path}"
    end
    if opts[:root]
      surun cmd
    else
      run cmd
    end
  end
  
  def cp(from, to, opts = {})
    if opts[:recursive]
      cmd = "cp -r #{opts[:options]} #{from} #{to}"
    else
      cmd = "cp #{opts[:options]} #{from} #{to}"
    end
    if opts[:root]
      surun cmd
    else
      run cmd
    end
  end
  
  def mv(from, to, opts = {})
    cmd = "mv #{opts[:options]} #{from} #{to}"
    if opts[:root]
      surun cmd
    else
      run cmd
    end
  end

end
