class Card

  SUITS = %I(D C H S).freeze
  VALUES = (2..14).to_a.freeze

  def initialize(value, suit)
    @value = value
    @suit = suit
  end


end
