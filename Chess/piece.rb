# require board?
class Piece
  def initialize(color = nil, type = nil)
    @color = color
    @type = type
  end

  def to_s
  end

  def valid_moves()
  end
end

class NullPiece < Piece

end

# For Example...
class King < Piece
  def initialize(color = nil, type = nil)
    super
  end
end
