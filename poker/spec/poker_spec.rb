require "card"
require "deck"
require "hand"
require "player"
require "game"

describe Card do
  subject(:card) { Card.new(2, :S) }

  describe "#initialize" do
    it "sets a suit"

    it "sets a value"

  end




end

describe Deck do
  subject(:deck) { Deck.new }

  describe "#initialize" do

    it "has a size of 52"

  end

  describe "#shuffle!" do
    it "shuffles the deck"

  end

  describe "#deal" do
    it "distributes cards to players"

  end

end
