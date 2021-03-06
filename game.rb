require_relative "deck"
require_relative "card"
require "pry"

class Games
  attr_accessor :player_hand, :dealer_hand, :dealer_value, :player_value, :deck, :bank
  def initialize # Creating the starting values and buckets for each game
    @win = 0
    @loss = 0
    @bank = 100
    @deck = Deck.new
    @deck.shuffle!
    @dealer_hand = []
    @player_hand = []
    @dealer_value = 0
    @player_value = 0
  end

  def play_game # Mail loop for our game, all of our methods are going to be called here.

    puts "want to play 21? ( y or n )"
    if gets.chomp.downcase == "y"
      2.times {@player_hand << @deck.draw}
      2.times {@dealer_hand << @deck.draw}
      calculate
      render_hand
      game_loop
    else  # defines what happens if someone doesnt want to play
      puts "Come back again"
    end
  end

  def calculate # Keeping track of player and dealer score
    @player_sum = 0
    @dealer_sum = 0
    @player_hand.each{|card| @player_sum += card.value}
    @dealer_hand.each{|card| @dealer_sum += card.value}
  end

  def game_loop # after the inital deal, this will loop through until the end of the game
    hit?
    calculate
    if @player_sum >= 21 or @dealer_sum >= 21 # This is broken <--------
      end_game
    else
      game_loop
    end
  end


  def render_hand
    puts("Player: #{@player_hand.map{|card| card.to_s}.join ", "}")
    puts("Dealer: #{@dealer_hand.first.to_s}")
  end

  def hit?
    puts "do you want to hit? ( y or n )" # getting a responce about if someone wants to get another card or not
    if gets.chomp.downcase == "y"
      @player_hand << @deck.draw
      render_hand
    else
      end_game
    end
  end

  def end_game # dealing with the end of the game
    while @dealer_sum < 17
      card = @deck.draw
      @dealer_hand << card
      @dealer_sum += card.value
      puts("Dealer: #{@dealer_hand.each{|card| card.to_s}.join ", "}")
    end

    if @player_sum > 21
      puts "player busts"
    elsif @dealer_sum > 21
      puts "dealer busts"
    else
      puts(@player_sum > @dealer_sum ? "player wins" : "dealer wins")
    end
    exit
  end

end
Games.new.play_game
