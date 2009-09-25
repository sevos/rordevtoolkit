class A
  def self.inherited(klass)
    puts klass.singleton_methods.inspect
    # klass.supported? # pluje, że nie ma metody
  end
end 

class B < A
  def self.supported?
    true
  end
end 
