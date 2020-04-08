class PolyTreeNode
  def initialize(value)
    @value = value
    @children = []
    @parent = nil
  end

  def parent
    return @parent 
  end

  def parent=(parent)
    if !parent.nil? # checks if the param passed down (parent) is nil
      if !@parent.nil?
        @parent.children.delete(self) # delete's the current node from the parent's child list
      end
      @parent = parent # set's our instance variable to the parent param
      @parent.children.push(self) #pushes self onto the new parent's child list
      @parent.children = @parent.children.uniq # remove duplicate children from the array children.
    else 
      @parent = nil 
    end
  end

  def children
    return @children
  end

  def add_child(newNode)
    @children.push(newNode)
  end

  def children=(new_children_arr)
    @children = new_children_arr
  end

  def value
    return @value 
  end

  def dfs(target_value)
    if self == target_value
      return self 
    else 
      @children.each {|el| dfs(target_value)}
    end
  end

  def bfs(target_value)
  end

end