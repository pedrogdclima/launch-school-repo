
INITIAL_STATE = " "
PLAYER_MARKER = "X"
COMPUTER_MARKER = "O"

def prompt(message)
  puts "===#{message}==="
end

def display_board(brd)
  system "clear"
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----|-----|-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----|-----|-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end

def initialize_board
  clean_board = {}
  (1..9).each { |n| clean_board[n] = INITIAL_STATE }
  clean_board
end

def empty_squares(brd)
  brd.keys.select { |n| brd[n] == INITIAL_STATE }
end

def player_place_marker!(brd)
  placement = ""
  loop do
    prompt "Choose one of #{empty_squares(brd).join(' ')}"
    placement = gets.chomp.to_i
    break if empty_squares(brd).include?(placement)
    prompt "That is not a valid choice. Try again."
  end
  brd[placement] = PLAYER_MARKER
end

def computer_places_marker!(brd)
  placement = empty_squares(brd).sample
  brd[placement] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  winning_lines = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                  [[1, 5, 9], [3, 5, 7]]
  winning_lines.each do |line|
    if brd[line[0]] == PLAYER_MARKER &&
       brd[line[1]] == PLAYER_MARKER &&
       brd[line[2]] == PLAYER_MARKER
      return "Player"
    elsif brd[line[0]] == COMPUTER_MARKER &&
          brd[line[1]] == COMPUTER_MARKER &&
          brd[line[2]] == COMPUTER_MARKER
      return "Computer"
    end
  end
  nil
end

loop do
  board = initialize_board
  loop do
    display_board(board)
    player_place_marker!(board)
    break if board_full?(board) || someone_won?(board)
    computer_places_marker!(board)
    break if board_full?(board) || someone_won?(board)
  end
  
  display_board(board)
  
  if someone_won?(board)
    prompt "#{detect_winner(board)} won!"
  else
    prompt "It's a tie"
  end
  prompt "Do you want to play again?"
  answer = gets.chomp
  break unless answer.downcase.start_with?("y")
end

prompt "Thanks for playing!"