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

  def parent=
    # self.parent = (some node)
  end
end


# Write a class with four methods:

# A #parent method that returns the node's parent.
# A #children method that returns an array of children of a node.
# A #value method that returns the value stored at the node.
# Write a #parent= method which (1) sets the parent property and (2) adds the node to their parent's array of children (unless we're setting parent to nil).
# Run bundle exec rspec to run the provided tests. At this point, all the specs for #initialize and most of the specs for #parent= should pass. (We'll get to the other specs soon!)
