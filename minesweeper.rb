require_relative 'board'

class Minesweeper
    def initialize()
      @board = Board.new
    end

    def play_move()
      @board.display
      puts "Please enter a position to discover"
      pos = gets.chomp.split(',').map { |e| Interger(e) }

      @board.play(pos)
    end
end
