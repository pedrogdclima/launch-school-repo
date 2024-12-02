=begin
Twenty-One is a card game consisting of a dealer and a player, where the
participants try to get as close to 21 as possible without going over.

Here is an overview of the game:
- Both participants are initially dealt 2 cards from a 52-card deck.
- The player takes the first turn, and can "hit" or "stay".
- If the player busts, he loses. If he stays, it's the dealer's turn.
- The dealer must hit until his cards add up to at least 17.
- If he busts, the player wins. If both player and dealer stays, then the
  highest total wins.
- If both totals are equal, then it's a tie, and nobody wins.
=end

module Hand
  attr_reader :hand

  def initialize(deck)
    @hand = []
    2.times { deck.deal(self) }
  end

  def hit(deck)
    @hand << deck.deal
    puts "#{self.class} hit!"
  end

  def hand_total
    total_value = 0
    hand.each do |card|
      case card.face
      when 2..10
        total_value += card.face
      when 'jack', 'queen', 'king'
        total_value += 10
      when 'ace'
        total_value += 1
      end
    end
    total_value += 10 if any_aces? && (total_value + 10) < 22
    total_value
  end

  def any_aces?
    any_aces = false
    hand.each do |card|
      any_aces = true if card.face == 'ace'
    end
    any_aces
  end

  def display_hand
    string = "#{self.class}'s hand: "
    hand.each do |card|
      string << "#{card.face} and "
    end
    puts string.delete_suffix(" and ") + " for a total of #{hand_total}."
  end
end

class Dealer
  include Hand

  def display_hand
    if hand.size < 3
      puts "#{self.class}'s hand: #{hand[0].face} and unknown"
    else
      super
    end
  end
end

class Player
  include Hand
end

class Deck
  FACES = (2..10).to_a + %w(ace jack queen king)
  SUITS = %w(heart diamond spade club)
  attr_accessor :deck_array

  def initialize
    @deck_array = []
    shuffle_deck
  end

  def shuffle_deck
    FACES.each do |face|
      SUITS.each do |suit|
        deck_array << Card.new(face, suit)
      end
    end
    deck_array.shuffle!
  end

  def deal(player)
    player.hand << deck_array.shift
  end
end

class Card
  attr_reader :face, :suit

  def initialize(face, suit)
    @face = face
    @suit = suit
  end

  def to_s
    "#{face} of #{suit}s"
  end
end

class Game
  attr_reader :dealer, :player1, :deck

  def initialize
    @deck = Deck.new
    @dealer = Dealer.new(deck)
    @player1 = Player.new(deck)
  end

  def start
    puts "Welcome to Twenty One!"
    puts "Let's start!"
    loop do
      dealer.display_hand
      player1.display_hand
      player_turn
      dealer_turn unless busted?(player1)
      show_result
      next if play_again?
      break
    end
    puts "Thanks for playing, goodbye!"
  end

  private

  def play_again?
    puts "Would you like to play again?"
    answer = gets.chomp
    answer.downcase.start_with?("y")? true : false
  end

  def winning_hand(participant1, participant2)
    return participant1 if participant1.hand_total > participant2.hand_total
    participant2
  end

  def show_result
    if busted?(player1)
      puts "You went over 21 and lost"
    elsif busted?(dealer)
      puts "Dealer went over 21 and lost"
    elsif player1.hand_total == dealer.hand_total
      puts "It's a tie!"
    else
      winner = winning_hand(player1, dealer)
      puts "#{winner.class} wins with #{winner.hand_total}!"
    end
  end

  def busted?(participant)
    participant.hand_total > 21
  end

  def player_turn
    answer = ""
    loop do
      puts "Press 'enter' to hit or type 'stay' to stay."
      answer = gets.chomp.downcase
      break if answer == "stay"
      deck.deal(player1)
      player1.display_hand
      if busted?(player1)
        puts "Bust!"
        break
      end
    end
  end

  def dealer_turn
    until dealer.hand_total > 16
      deck.deal(dealer)
    end
    puts "Bust!" if busted?(dealer)
    dealer.display_hand
  end
end

Game.new.start
