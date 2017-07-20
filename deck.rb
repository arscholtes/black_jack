require_relative "card"

attr_accessor deck

def initialize # this is the array that we store the cards in
  @card_holder = []
  build_deck
end

cards.suits.each do |suit| # this is going through and creating the deck
  cards.faces.each do |face|
    card_holder << Card.new( faces, suit )
  end
end

def shuffle # Shuffle the deck
  card_holder.shuffle!
end

def draw # this is the action we will set for when the dealer or player 'hits'
  card_holder.shift
end
