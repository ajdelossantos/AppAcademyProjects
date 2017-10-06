require_relative 'tile'

class Board
  attr_reader :lost

  def initialize()
    @grid = Array.new(9) { Array.new(9) { Tile.new(0) } }
    populate_bombs
    populate_numbers
    @lost = false
  end

  def populate_bombs
    bombs_number = 10
    positions = []
    (0...@grid.length).each do |i|
      (0...@grid[0].length).each {|j| positions << [i,j] }
    end
    positions.shuffle!
    bombs_number.times do
      self[positions.pop].value = '#'
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

          adjacents = adjacent_squares([i,j])

          bombs = adjacents.select do |pos|
            self[pos].is_bomb?
          end

          self[[i,j]].value = bombs.length
        end
      end
    end
  end

  def adjacent_squares(pos)
    i,j = pos
    adjacent_move = [-1, 0, 1].permutation(2).to_a + [[-1, -1], [1, 1]]
    adjacent_move = adjacent_move.select do |m|
      pos_in_range?([i+m[0], j+m[1]])
    end
    adjacent_move.map { |m| [i+m[0], j+m[1]] }
  end

  # def fringe(pos)
  #   to_visit = [pos]
  #   visited = [pos]
  #
  #   while to_visit.length > 0
  #     #
  #     #  = to_visit.shift
  #   end
  # end

  def play(pos)
    @lost = true if self[pos].value == "#"
    self[pos].reveal
  end

  def game_over?
    not_bombs = @grid.flatten.select { |tile| !tile.is_bomb? }
    not_bombs.all? { |tile| tile.face_up } || @lost
  end
end
