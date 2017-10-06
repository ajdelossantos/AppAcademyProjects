require 'byebug'

class PolyTreeNode

  def initialize(value)
    @parent = nil
    @value = value
    @children = []
  end

  def parent
    @parent
  end

  def children
    @children
  end

  def value
    @value
  end

  def parent=(node)
    return nil if node == @parent

    # Removes self from @parent.child
    unless @parent.nil?
      @parent.children.delete(self)
    end

    # Assign parent to node

    @parent = node
    @parent.children << self unless node.nil?
  end


  def add_child(child_node)
    child_node.parent = self
  end

  def remove_child(child_node)
    raise ArgumentError "That's not a child!" if
      !self.children.include?(child_node)

    child_node.parent = nil
  end

  # Write a #dfs(target_value) method which takes a value to search for and performs the search. Write this recursively.
  # First, check the value at this node. If a node's value matches the target value, return the node.
  # If not, iterate through the #children and repeat.

  def dfs(target)
    return self if self.value == target
    self.children.each do |child|
      result = child.dfs(target)
      return result if result
    end
    nil
  end

  # Write a #bfs(target_value) method to implement breadth first search.
  # You will use a local Array variable as a queue to implement this.
  # First, insert the current node (self) into the queue.
  # Then, in a loop that runs until the array is empty:
  # Remove the first node from the queue,
  # Check its value,
  # Push the node's children to the end of the array.
  # Prove to yourself that this will check the nodes in the right order. Draw it out. Show this explanation to your TA.

  def bfs(target)
    queue = []
    # FIFO -- Array#unshift and Array#pop
    queue.unshift(self)
    # (iterating queue's |el| )
    until queue.empty?
      # queue.unshift(queue.last.children)
      queue.last.children.each do |child|
        queue.unshift(child)
      end
      check_node = queue.pop
      return check_node if check_node.value == target
    end

    nil
  end

end
