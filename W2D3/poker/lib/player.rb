class Player

attr_accessor :hand
  def initialize(name = "hi", hand = [], pot = 0)
    @name = name
    @hand = hand
    @pot = pot
  end
end
