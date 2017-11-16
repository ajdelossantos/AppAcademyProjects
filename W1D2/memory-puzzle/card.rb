require_relative 'board.rb'
require_relative 'game.rb'
require 'byebug'

class Card
  attr_accessor :face_up
  attr_reader :face_value

  def initialize(face_value)
    @face_up = false
    @face_value = face_value
  end

  def hide
    @face_up = false
  end


  def reveal
    @face_up = true
    @face_value
  end


  def to_s
    @face_value
  end

  def ==(other_card)
    
    self.face_value == other_card.face_value

  end
end

# card = Card.new(saodifadj)
# puts card => p card.to_s
# card.to_s => @face_value
# p @face_value
