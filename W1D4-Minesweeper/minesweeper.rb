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
        @board.display
        puts "GAME OVER, YEAAAAAAHHHHHHH"
      else
        @board.display
        puts "YOU WIN!!!!!!!!!"
      end
    end
end

if __FILE__ == $PROGRAM_NAME
  game = Minesweeper.new
  game.run
end
