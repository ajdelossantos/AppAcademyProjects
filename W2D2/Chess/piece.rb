require 'singleton'

class Piece
  def initialize(pos, color = nil, type = nil)
    @color = color
    @type = type
    @pos = pos
  end

  def to_s
    # Delimit by " "
    " #{@type} "
  end

  def empty?
    type.nil?
  end

  def valid_moves
    # Array of positions
    []
  end

  def in_bounds?(pos)
    return true if (0..7).cover?(pos[0]) && (0..7).cover?(pos[1])
    false
  end
end

class NullPiece < Piece
  include Singleton
  def initialize(pos = nil, color = nil, type = nil)
    super
  end

  def to_s
    # Delimit by " "
    " X "
  end

end

module StepablePiece
  def valid_moves
    potential_moves = self.move_dir.select do |diff|
      x = @pos[0] + diff[0]
      y = @pos[1] + diff[1]
      in_bounds?([x, y])
    end
    potential_moves.map! do |diff|
      [diff[0] + @pos[0], diff[1] + @pos[1]]
    end
  end
end

class Knight < Piece
  include StepablePiece
  def initialize(pos = nil, color = nil, type = :N)
    super
  end

  def move_dir
    [[1, 2], [2, 1], [-1, -2], [-2, -1], [-1, 2], [2, -1], [1, -2], [-2, 1]]
  end
end



class King < Piece
  include StepablePiece
  def initialize(pos, color = nil, type = :K)
    super
  end
  def move_dir
    [[0, 1], [0, -1], [1, -1], [1, 1], [1, -1], [-1, 1], [-1, -1], [1, -1]]
  end
end
