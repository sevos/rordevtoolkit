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
    cmd = "find #{dirs.join(' ')} -name #{file_pattern}"
    result = surun(cmd, true)
    result.split("\n")
  end

end
