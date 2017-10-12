require 'byebug'

class Card

  VALUES = {

    2 => "2",
    3 => "3",
    4 => "4",
    5 => "5",
    6 => "6",
    7 => "7",
    8 => "8",
    9 => "9",
    10 => "10",
    11 => "J",
    12 => "Q",
    13 => "K",
    14 => "A"
  }



  attr_reader :suit, :value

  def initialize(value, suit)
    @value = value
    @suit = suit
  end

  def to_s

    puts "#{@suit}"  + VALUES[@value]

  end

end
