require_relative 'card.rb'
require_relative 'game.rb'
require 'byebug'

class Board
  attr_accessor :grid, :pairs

  def initialize(grid = Board.empty_grid)
    @grid = grid
    self.populate
    # @pairs = pairs
  end

  def self.empty_grid
    Array.new(2) { Array.new(2) }
  end

  def [](pos)
    #getter
    row, col = pos
    grid[row][col]
  end

  def []=(pos, value)
    #setter
    row, col = pos # => [row, col]
    # debugger
    grid[row][col] = value
  end

  def populate
    # Find out how many cards you need
    pairs = (self.grid.length**2) / 2
    # Make something to put the cards into
    deck = []

    # Make cards with half that number as pairs, i.e. 4 cards, 2 values
    (1..pairs).each do |value|
      2.times do
        deck << Card.new(value) # After making the pool of cards...
      end
    end

    # ... use iterator to randomly place on board
    deck.shuffle!

    # debugger
    # self grabs grid (attr_reader)
    self.grid.each_with_index do |row, i|
      row.each_with_index do |_col, j|
        self[[i, j]] = deck.pop
      end
    end

  end


  # def place_card(pos)
  #   self[pos] = Card.new # a card object
  # end

  def render
    puts "Row 0: #{display_value(self[[0, 0]])}, #{display_value(self[[0, 1]])}"
    puts "Row 1: #{display_value(self[[1, 0]])}, #{display_value(self[[1, 1]])}"
  end

  def display_value(card)
    # debugger

    card.face_up ? card.face_value : "@"
  end


  def won?; end

  def reveal(guessed_pos)
    if !self[guessed_pos].face_up
      self[guessed_pos].face_up == true
      return self[guessed_pos].face_value
    end

    puts "Not quite yet functional..."
  end

end


# def [](pos)
#   row, col = pos
#   grid[row][col]
# end
#
# def []=(pos, value)
#   row, col = pos
#   grid[row][col] = value
# end


# def place_mark(pos, mark)
#   self[pos] = mark
# end

# def cols
#   cols = [[], [], []]
#   grid.each do |row|
#     row.each_with_index do |mark, col_idx|
#       cols[col_idx] << mark
#     end
#   end
#
#   cols
# end
