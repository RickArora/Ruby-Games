class PolyTreeNode
  def initialize(value)
    @value = value
    @children = []
    @parent = nil
  end

  def parent
    return @parent 
  end

  def parent=
  end

  def children
    return @children
  end

  def value
    return @value 
  end

end