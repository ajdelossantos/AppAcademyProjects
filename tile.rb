class Tile
  attr_accessor :value

  def initialize(value)
    @value = value
    @face_up = false
    @flagged = false
  end

  def is_bomb?
    @value == '*'
  end

  def to_s
    " #{@value.to_s}" 
  end

end
