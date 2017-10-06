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

end


# Write a class with four methods:

# A #parent method that returns the node's parent.
# A #children method that returns an array of children of a node.
# A #value method that returns the value stored at the node.
# Write a #parent= method which (1) sets the parent property and (2) adds the node to their parent's array of children (unless we're setting parent to nil).
# Run bundle exec rspec to run the provided tests. At this point, all the specs for #initialize and most of the specs for #parent= should pass. (We'll get to the other specs soon!)
