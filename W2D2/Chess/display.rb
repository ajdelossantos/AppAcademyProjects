require 'colorize'
require_relative 'cursor'
require_relative 'board'

class Display
  attr_reader :cursor, :board

  def initialize
    @board = Board.new
    @cursor = Cursor.new([0, 0], @board)
  end

  def render
    system('clear')
    @board.grid.each_with_index do |row, x|
      row.each_with_index do |el, y|
        pos = [x, y]
        if pos == @cursor.cursor_pos
          print " #{el.to_s} ".on_red
        else
          print " #{el.to_s} "
        end
      end
      puts ""
    end
  end

end

# TODO Import logic into board.rb
# move_from = @cursor.get_input
# move_to   = @cursor.get_input
# @board[move_to]   = @board[move_from]
# @board[move_from] = NullPiece.instance

=begin
load 'display.rb'
d = Display.new
q
k = King.new([3, 3], 'b', :K)
n = Knight.new([1, 1], 'w', :N)
d.board[[3, 3]] = k
d.board[[1, 1]] = n
d.render

=end
