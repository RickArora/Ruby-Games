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

  def add_child(new_node)
    @children.push(new_node)
    new_node.parent = self
  end

  def remove_child(remove_node)
    if remove_node.parent.nil? 
      raise "Not a child" 
    end
    remove_node.parent = nil
    @children.delete(remove_node)
  end

  def children=(new_children_arr)
    @children = new_children_arr
  end

  def value
    return @value 
  end

  def dfs(target_value)
    if self.value == target_value
      return self 
    else
      @children.each do |el| 
        res = el.dfs(target_value) 
        return res unless res.nil? 
      end
    end
    return nil
  end

  def bfs(target_value)
    queue = []
    queue.push(self)
    while !queue.nil?
      if queue[0].value == target_value
        return queue
      else 
        queue.delete_at(0)
        queue.push(@children)
      end
    end
  end

end