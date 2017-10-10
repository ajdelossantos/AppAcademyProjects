require 'colorize'
require_relative 'cursor'
require_relative 'board'

class Display
  def initialize
    @board = Board.new
    @cursor = Cursor.new([0, 0], @board)
  end

  def render
    puts @board.grid[0].each { |el| print el.to_s }
    puts @board.grid[1].each { |el| print el.to_s }
    puts @board.grid[2].each { |el| print el.to_s }
    puts @board.grid[3].each { |el| print el.to_s }
    puts @board.grid[4].each { |el| print el.to_s }
    puts @board.grid[5].each { |el| print el.to_s }
    puts @board.grid[6].each { |el| print el.to_s }
    puts @board.grid[7].each { |el| print el.to_s }
  end

end
