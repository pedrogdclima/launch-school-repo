
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

  def size
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
    return -1 if size < other.size
    return 1 if size > other.size
    return 0 if size == other.size
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

deck = Deck.new
drawn_cards = []
52.times{drawn_cards << deck.draw}
p drawn_cards.count{|card| card.rank == 10} == 4
p drawn_cards.count{|card| card.suit == "Spades"} == 13

drawn_cards_2 = []
52.times{drawn_cards_2 << deck.draw}
p drawn_cards_2.size == drawn_cards.size
p drawn_cards != drawn_cards_2
puts drawn_cards[0]
puts drawn_cards_2[0]
