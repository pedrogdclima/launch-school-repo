require "pry"

SUITS = ["Clubs", "Hearts", "Spades", "Diamonds"]
FACES = [] + ("2".."10").to_a + ["Jack", "Queen", "King", "Ace"]

def return_face_for_card(face)
  case face
  when ("2".."10")
    face.to_i
  when "Jack", "Queen", "King", "Ace"
    face[0]
  end
end

def return_suit_for_card(suit)
  case suit
  when "Clubs"
    "\u2663".encode('utf-8')
  when "Hearts"
    "\u2665".encode('utf-8')
  when "Spades"
    "\u2660".encode('utf-8')
  when "Diamonds"
    "\u2666".encode('utf-8')
  end
end

lines = ["", "", "", "", "", "", ""]

player_hand = [{face: "Jack", suit: "Clubs"}, {face: "Queen", suit: "Hearts"}, {face: "King", suit: "Diamonds"}, {face: "Ace", suit: "Spades"}]

player_hand.each_with_object(lines) do |card|
  lines[0] << "\u256d".encode('utf-8') + "\u2500".encode('utf-8') + "\u2500".encode('utf-8') + "\u2500".encode('utf-8') + "\u2500".encode('utf-8')+ "\u2500".encode('utf-8') + "\u256e".encode('utf-8') + "  " #" ----- " + "  "
  lines[1] << "|#{return_face_for_card(card[:face])}    |" + "  "
  lines[2] << "|     |" + "  "
  lines[3] << "|  #{return_suit_for_card(card[:suit])}  |" + "  "
  lines[4] << "|     |" + "  "
  lines[5] << "|    #{return_face_for_card(card[:face])}|" + "  "
  lines[6] << " ----- " + "  "
end

puts lines
puts "😊"

def display_card_graphically(card, line)
  puts " ----- " + "  "
  if card[:face] == "10"
    puts "|#{return_face_for_card(card[:face])}   |"
  else
   puts "|#{return_face_for_card(card[:face])}    |"
  end
  puts "|     |"
  puts "|  #{card[:suit][0]}  |"
  puts "|     |"
  if card[:face] == "10"
    puts "|   #{return_face_for_card(card[:face])}|"
  else
   puts "|    #{return_face_for_card(card[:face])}|"
  end
  puts " ----- "
end

def prompt(message)
  puts "=> #{message}"
end

def card_to_string(card)
  "#{card[:face]} of #{card[:suit]}"
end

def display_hand(hand,who)
  if who == "player"
    prompt "You have:"
    hand.each do |card|
      prompt  "A #{card_to_string(card)}" # "A #{card[:face]} of #{card[:suit]}"
    end
    puts "\n"
  else
    prompt "Dealer has a #{card_to_string(hand[0])} and one unknown card"
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
=begin
deck = [] # [{face: "King", suit: "Club"}, {face: "Queen", suit: "Club"}...]

prompt "Welcome to twenty one! Try to get your hand total as close to 21 without going over!"
sleep 2

loop do
  deck = initialize_deck.shuffle
  # 2. Deal cards to player and dealer
  player_hand = [deck.pop, deck.pop]
  dealer_hand = [deck.pop, deck.pop]
  display_hand(dealer_hand, "dealer")
  display_hand(player_hand, "player")
  player_hand.each do |card|
    display_card_graphically(card)
  end
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
=end