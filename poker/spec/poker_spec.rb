require "card"
require "deck"
require "hand"
require "player"
require "game"

describe Card do
  subject(:card) { Card.new(2, :S) }

  it "knows its suit and value" do
    expect(card.value).to eq(2)
    expect(card.suit).to eq(:S)
  end

  it "has a valid suit" do
    expect(card.value).to eq(2)
  end





end

describe Deck do
  subject(:deck) { Deck.new }
  let(:player) {Player.new}

  describe "#initialize" do
    context "contains all combinations of suits and values"
      it "has a size of 52" do
        expect(deck.deck.length).to eq(52)
      end

      it "each card is uniq" do
        expect(deck.deck.uniq).to eq(deck.deck)
      end


  end

  describe "#shuffle!" do
    it "shuffles the deck" do
      expect(deck.shuffle).to_not eq(deck)
    end
  end

  describe "#deal" do
    it "it deals a card to a player" do
      expect(deck.deal(player)).to eq(player.hand[0])
    end

  end

end

describe Hand do
  subject(:hand) { Hand.new}

  describe "#add" do
    it "adds a card to the hand"
  end

  describe "remove" do
    it "removes the card from the hand and sets its value to nil" do
      expect(hand.remove())
    end

    it "accepts a valid array index as an argument"
  end



  end
