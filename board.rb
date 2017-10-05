require_relative 'tile'

class Board
  def initialize()
    @grid = Array.new(9) { Array.new(9) { Tile.new(0) } }
    populate
  end

  def populate
    bombs_number = 10
    positions = []
    (0...@grid.length).each do |i|
      (0...@grid[0].length).each {|j| positions << [i,j] }
    end
    positions.shuffle!
    bombs_number.times do
      self[positions.pop].value = '⚽️'
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
      rows.each do |e|
        print e.value
      end
      puts
    end
  end
end

b = Board.new
b.display
