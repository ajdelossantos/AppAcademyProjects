require 'singleton'

class Piece
  def initialize(pos, color = nil, type = nil)
    @color = color
    @type = type
    @pos = pos
  end

  def to_s
    # Delimit by " "
    "#{@color} #{@type}"
  end

  def empty?
    type.nil?
  end

  def valid_moves
    # Array of positions
    []
  end
end

class NullPiece < Piece
  include Singleton
  def initialize(pos = nil, color = nil, type = nil)
    super
  end
end

# For Example...
class King < Piece
  # TODO Include moduleStepable
  def initialize(pos, color = nil, type = nil)
    super
  end
end
