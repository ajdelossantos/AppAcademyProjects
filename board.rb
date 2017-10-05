require_relative 'tile'

class Board
  def initialize()
    @grid = Array.new(9) { Array.new(9) { Tile.new(0) } }
    populate_bombs
    populate_numbers
  end

  def populate_bombs
    bombs_number = 10
    positions = []
    (0...@grid.length).each do |i|
      (0...@grid[0].length).each {|j| positions << [i,j] }
    end
    positions.shuffle!
    bombs_number.times do
      self[positions.pop].value = '*'
    end
  end

  def [](pos)
    a,b = pos
    @grid[a][b]
  end

  def []=(pos, val)
    a,b = pos
    @grid[a][b] = val
  end

  def display
    @grid.each do |rows|
      rows.each do |tile|
        print tile.to_s
      end
      puts
    end
  end

  def pos_in_range?(pos)
    a,b = pos
    (0...@grid.length).cover?(a) && (0...@grid.length).cover?(b)
  end

  def populate_numbers
    # check neighbor's value
    (0...@grid.length).each do |i|
      (0...@grid[0].length).each do |j|

        unless self[[i,j]].is_bomb?
          adjacent_move =
            [-1, 0, 1].permutation(2).to_a + [[-1, -1], [1, 1]]

          bombs = adjacent_move.select do |m|
            pos_in_range?([i+m[0], j+m[1]]) && self[[i+m[0], j+m[1]]].is_bomb?
          end

          self[[i,j]].value = bombs.length
        end
      end
    end


  end

end

b = Board.new
b.display
