class Tile
  attr_accessor :value
  attr_reader :face_up

  def initialize(value)
    @value = value
    @face_up = false
    @flagged = false
  end

  def is_bomb?
    @value == '#'
  end

  def to_s
    @face_up ? " #{@value}" : ' *'
  end

  def reveal
    @face_up = true
  end

end
