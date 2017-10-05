require_relative 'board'

class Minesweeper
    def initialize()
      @board = Board.new
    end

    def play_move()
      @board.display
      puts "Please enter a position to discover"
      pos = gets.chomp.split(',').map { |e| Integer(e) }

      @board.play(pos)
    end

    def run
      until @board.game_over?
        play_move
      end
      if @board.lost
        puts "GAME OVER, YEAAAAAAHHHHHHH"
      else
        puts "YOU WIN!!!!!!!!!"
      end
    end
end
