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

# These methods should be one- or two-liners that call #parent=.

  def add_child(child_node)
    child_node.parent = self
  end

  def remove_child(child_node)
    raise ArgumentError "That's not a child!" if
      !self.children.include?(child_node)

    child_node.parent = nil
  end

end


# Write a class with four methods:

# A #parent method that returns the node's parent.
# A #children method that returns an array of children of a node.
# A #value method that returns the value stored at the node.
# Write a #parent= method which (1) sets the parent property and (2) adds the node to their parent's array of children (unless we're setting parent to nil).
# Run bundle exec rspec to run the provided tests. At this point, all the specs for #initialize and most of the specs for #parent= should pass. (We'll get to the other specs soon!)
