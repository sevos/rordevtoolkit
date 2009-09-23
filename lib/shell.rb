module Shell
  
  def shell_su_commands 
    return {
      :ubuntu => 'sudo /bin/sh -c "+cmd+"',
      :fedora => 'su -c "+cmd+"'
    }
  end

  def run(cmd)
    Kernel.system(cmd)
  end

  def surun(cmd)
    return run(shell_su_commands[distribution].gsub('+cmd+',cmd))
  end

end
