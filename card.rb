class Card
  def self.faces
    %w(Ace 2 3 4 5 6 7 8 9 10 Jack Queen King) # Def our different types of cards
  end

  def initialize(face, suit) # creating our cards
    @face = face
    @suit = suit
    set_value
  end

  def self.suits
    %w(Spades Clubs Diamonds Hearts) # Def our different suits that we can apply to our card values
  end

  def set_value # Giving values to our cards for when we initialize them
    if %w(Jack, Queen, King, 10).include? face
      value = 10
    elsif face == "Ace"
      value = 11
    else
      value = face.to_i
    end

  def +(other_card) # this is where we are putting how to get a sum of the values of cards in our hands
    value + other_card.value
  end

  def to_s # this is the model we will use to provide a visual to the player of a card
    "#{face} of #{suit}"
  end

end
