require_relative "card"
require_relative "player"

class Deck
  SUITS = %I(D C H S).freeze


  attr_reader :deck
  def initialize()
    @deck = Deck.setup

  end

  def self.setup
    deck = Array.new

    SUITS.each do |suit|
      (2..14).each do |value|
        deck << Card.new(value,suit)
      end
    end

    return deck

  end

  def deal(player)
    card = deck.pop
    player.hand << card
    return card
  end



  def shuffle
    @deck.shuffle!
  end

  def display
    @deck.each do |card|
      card.to_s
    end

  end





end

d = Deck.new
d.display
d.shuffle
d.display
