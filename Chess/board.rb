require 'piece'
class Board

  def initialize
    @grid = Array.new(8) { Array.new(8) }
    # @grid.each { |row| row.each { |el| el = NullPiece.instance } }
  end

  def []=(pos, piece)
    x, y = pos
    @grid[x][y] = piece
  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def move_piece(start_pos, end_pos)
    s_x, s_y = start_pos
    e_x, e_y = end_pos
    raise StandardError
    @grid[e_x][e_y] = @grid[s_x][s_y]
    @grid[s_x][s_y] = NullPiece.new
  end
end
