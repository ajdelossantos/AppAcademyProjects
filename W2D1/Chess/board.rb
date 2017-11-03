require_relative 'piece'
require_relative 'display'
class Board

  def initialize
    @grid = Array.new(8) { Array.new(8) }
    self.populate
  end

  def populate
    @grid.each_with_index do |row, x|
      row.each_index do |y|
        pos = [x, y]
        self[pos] = NullPiece.instance
      end
    end
  end

  def []=(pos, piece = board[pos[0], pos[1]])
    x, y = pos
    @grid[x][y] = piece
  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def move_piece!(start_pos, end_pos)
    s_x, s_y = start_pos
    e_x, e_y = end_pos

    self[e_x][e_y] = self[s_x][s_y]
    self[s_x][s_y] = NullPiece.instance
  end

  def move_piece(color, start_pos, end_pos)
    raise StandardError unless valid_move?(color, start_pos, end_pos)
  rescue StandardError
    puts "Illegal move, please try again"
    #TODO add retry until we get a legal move
    # if legal...
  ensure
    move_piece!(start_pos, end_pos)
  end

  def valid_move?(color, start_pos, end_pos)
    #TODO logic when in "check"
    return false if self[start_pos].empty?
    return false if self[end_pos].color == color
    return false unless self[start_pos].valid_moves.include?(end_pos)
    true
  end
end
