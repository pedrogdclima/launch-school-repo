require "pry"

SUITS = ["Clubs", "Hearts", "Spades", "Diamonds"]
FACES = [] + ("2".."10").to_a + ["Jack", "Queen", "King", "Ace"]

# 1. Initialize deck
#  -52 card deck
#  -4 suits (club, heart, spade, diamond)
#  -13 values (2 through 10 and Jack, Queen, King, and Ace)
#   -numbers have face value, J, Q, and K are 10, and Ace is 1 or 11

# Ace value calc
# ace is 11 unless it puts players hand total over 21, then its 1
# ace is 11 unless sum of other cards is greater than 10

# def ace_value(face, hand)
#   total_minus_ace = 0
#   hand.each do |e|
#     if face == "Ace"
#       next
#     else
#       total_minus_ace += return_face_value(face, hand)
#     end
#   end
#   if total_minus_ace > 10
#     return 1
#   else
#     return 11
#   end
# end

def prompt(message)
  puts "=> #{message}"
end

def display_hand(hand,who)
  if who == "player"
    prompt "You have:"
    hand.each do |card|
      prompt "A #{card[:face]} of #{card[:suit]}"
    end
  else
    prompt "Dealer has a #{hand[0][:face]} of #{hand[0][:suit]} and one unknown card"
  end
end

def initialize_deck
  new_deck = SUITS.map do |suit|
    FACES.map do |face|
      {face: face, suit: suit}
    end
  end
  new_deck.flatten
end

def return_face_value(face, hand)
  case face
  when ("2".."10")
    face.to_i
  when "Jack", "Queen", "King"
    10
  when "Ace"
    one_or_eleven(hand)
  end
end

def aceless_total(hand)
  sum = 0
  for i in hand do
    next if i[:face] == "Ace"
    sum += return_face_value(i[:face], hand)
  end
  sum
end  

def one_or_eleven(hand)
  return 11 if aceless_total(hand) < 10
  1
end  

def hand_total(hand)
  sum_of_values = 0
  hand.each do |element|
    sum_of_values += return_face_value(element[:face], hand)
  end
  sum_of_values
end

def bust?(hand)
  if hand_total(hand) > 21
    true
  else
    false
  end
end

def return_winner(player_hand, dealer_hand)
  if hand_total(dealer_hand) >= hand_total(player_hand)
    "dealer"
  else
    "player"
  end
end

deck = [] # [{face: "King", suit: "Club"}, {face: "Queen", suit: "Club"}...]
loop do
  deck = initialize_deck.shuffle
  # 2. Deal cards to player and dealer
  player_hand = [deck.pop, deck.pop]
  dealer_hand = [deck.pop, deck.pop]
  display_hand(player_hand, "player")
  display_hand(dealer_hand, "dealer")
  loop do
    # 3. Player turn: hit or stay
    # - repeat until bust or "stay"
    prompt "Do you want to hit?"
    answer = gets.chomp
    break if !answer.downcase.start_with?("y")
    player_hand << deck.pop
    display_hand(player_hand, "player")
    # 4. If player bust, dealer wins.
    if bust?(player_hand)
      prompt "Bust! Your hand is over 21!"
      prompt "Dealer wins this time."
      break
    else
      next
    end
  end
  # 5. Dealer turn: hit or stay
  # - repeat until total >= 17
  if !bust?(player_hand)
    loop do
      if hand_total(dealer_hand) < 17
        prompt "Dealer hits"
        sleep 1
        dealer_hand << deck.pop
        if bust?(dealer_hand)
          prompt "Bust! Dealer's hand is over 21!"
          prompt "You win this time."
          break
        end
        next
      else
        prompt "Dealer stays"
        sleep 1
        binding.pry
        break
      end
    end
  end 
  prompt "Do you want to play again?"
  play_again = gets.chomp
  if play_again.downcase.start_with?("y")
    system("clear")
    next
  else
    break
  end
end



# 6. If dealer bust, player wins.
# 7. Compare cards and declare winner.
sleep 0.5
prompt "Thanks for playing!"
prompt "twentyone.rb - Pedro Lima - 04.2024"
sleep 1