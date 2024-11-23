class Card
  include Comparable
  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def to_s
    "#{@rank} of #{@suit}"
  end

  def value
    case @rank
    when "Jack"
      11
    when "Queen"
      12
    when "King"
      13
    when "Ace"
      14
    else
      @rank
    end
  end

  def <=>(other)
    return -1 if value < other.value
    return 1 if value > other.value
    return 0 if value == other.value
    nil
  end
end

class Deck
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  def initialize
    @deck = []
    shuffle
  end

  def shuffle
    RANKS.each do |rank|
      SUITS.each do |suit|
        @deck << Card.new(rank, suit)
      end
    end
    @deck.shuffle!
  end

  def draw
    shuffle if @deck.empty?
    @deck.pop
  end
end

class PokerHand
  attr_reader :hand, :rank_count

  def initialize(deck)
    @hand = []
    @rank_count = Hash.new(0)
    5.times do
      card = deck.draw
      hand << card
      rank_count[card.rank] += 1
    end
  end

  def print
    puts hand
  end

  def evaluate
    case
    when royal_flush?     then 'Royal flush'
    when straight_flush?  then 'Straight flush'
    when four_of_a_kind?  then 'Four of a kind'
    when full_house?      then 'Full house'
    when flush?           then 'Flush'
    when straight?        then 'Straight'
    when three_of_a_kind? then 'Three of a kind'
    when two_pair?        then 'Two pair'
    when pair?            then 'Pair'
    else                       'High card'
    end
  end

  private

  def royal_flush?
    true if straight_flush? && hand.min.value == 10
  end

  def straight_flush?
    true if flush? && straight?
  end

  def four_of_a_kind?
    true if rank_count.any?{|_,v|v==4}
  end

  def full_house?
    true if true if rank_count.any?{|_,v|v==2} && true if rank_count.any?{|_,v|v==3}
  end

  def flush?
    true if hand.all?{|card|card.suit == hand[0].suit}
    # return true if hand.map{|card|card.suit}.uniq.size == 1
  end

  def straight?
    true if  rank_count.all?{|_,v|v == 1} && hand.max.value - hand.min.value == 4
  end

  def three_of_a_kind?
    true if rank_count.any?{|_,v|v==3}
  end

  def two_pair?
    true if rank_count.values.count(2) == 2
  end

  def pair?
    true if rank_count.any?{|_,v|v==2}
  end
end

deck = Deck.new
three_player_poker_game = []
10.times{three_player_poker_game << PokerHand.new(deck)}
p three_player_poker_game.map{|hand|hand.evaluate}
#p three_player_poker_game.map{|hand|hand[0].suit}


# hand = PokerHand.new(Deck.new)
# hand.print
# puts hand.evaluate

# Danger danger danger: monkey
# patching for testing purposes.
class Array
  alias_method :draw, :pop
end

# Test that we can identify each PokerHand type.
hand = PokerHand.new([
  Card.new(10,      'Hearts'),
  Card.new('Ace',   'Hearts'),
  Card.new('Queen', 'Hearts'),
  Card.new('King',  'Hearts'),
  Card.new('Jack',  'Hearts')
])
puts "Royal flush works? #{hand.evaluate == 'Royal flush'}"

hand = PokerHand.new([
  Card.new(8,       'Clubs'),
  Card.new(9,       'Clubs'),
  Card.new('Queen', 'Clubs'),
  Card.new(10,      'Clubs'),
  Card.new('Jack',  'Clubs')
])
puts "Straight flush works? #{hand.evaluate == 'Straight flush'}"

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts "Four of a kind works? #{hand.evaluate == 'Four of a kind'}"

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(5, 'Hearts')
])
puts "Full house works? #{hand.evaluate == 'Full house'}"

hand = PokerHand.new([
  Card.new(10, 'Hearts'),
  Card.new('Ace', 'Hearts'),
  Card.new(2, 'Hearts'),
  Card.new('King', 'Hearts'),
  Card.new(3, 'Hearts')
])
puts "Flush works? #{hand.evaluate == 'Flush'}"

hand = PokerHand.new([
  Card.new(8,      'Clubs'),
  Card.new(9,      'Diamonds'),
  Card.new(10,     'Clubs'),
  Card.new(7,      'Hearts'),
  Card.new('Jack', 'Clubs')
])
puts "Straight works? #{hand.evaluate == 'Straight'}"

hand = PokerHand.new([
  Card.new('Queen', 'Clubs'),
  Card.new('King',  'Diamonds'),
  Card.new(10,      'Clubs'),
  Card.new('Ace',   'Hearts'),
  Card.new('Jack',  'Clubs')
])
puts "Straight works? #{hand.evaluate == 'Straight'}"

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(6, 'Diamonds')
])
puts "Three of a works? #{hand.evaluate == 'Three of a kind'}"

hand = PokerHand.new([
  Card.new(9, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(8, 'Spades'),
  Card.new(5, 'Hearts')
])
puts "Two pair works? #{hand.evaluate == 'Two pair'}"

hand = PokerHand.new([
  Card.new(2, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(9, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts "Pair works? #{hand.evaluate == 'Pair'}"

hand = PokerHand.new([
  Card.new(2,      'Hearts'),
  Card.new('King', 'Clubs'),
  Card.new(5,      'Diamonds'),
  Card.new(9,      'Spades'),
  Card.new(3,      'Diamonds')
])
puts "High card works? #{hand.evaluate == 'High card'}"