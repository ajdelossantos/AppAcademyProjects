class BSTNode
  attr_reader :value
  attr_accessor :left, :right, :parent
  def initialize(value)
    @value = value
  end

  def add_val(node, value)
    if value <= @value
      if @left.nil?
        @left = node
        @left.parent = self
        return true
      else
        @left.add_val(node, value)
      end

    elsif value > @value
      if @right.nil?
        @right = node
        @right.parent = self
        return true
      else
        @right.add_val(node, value)
      end
    end

  false
  end

end
