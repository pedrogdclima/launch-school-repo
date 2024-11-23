
class Board
  WINNING_LINES = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[7,5,3],[1,5,9]]

  def initialize
    @squares = {}
    reset
  end

  def reset
    (1..9).each{|key| @squares[key] = Square.new}
  end

  def []=(position, marker)
    @squares[position].marker = marker
  end

  def unmarked_keys
    @squares.select{|key, value| value.unmarked?}.keys
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  def count_human_markers(squares)
    squares.map{|e|e.marker}.count(TTTGame::HUMAN_MARKER)
  end

  def count_computer_markers(squares)
    squares.map{|e|e.marker}.count(TTTGame::COMPUTER_MARKER)
  end



  def winning_marker
    WINNING_LINES.each do |line|
      three_squares = @squares.values_at(*line).map{|e|e.to_s}
      next if three_squares.any?(Square::INITIAL_VALUE)
      if three_squares.uniq.size == 1
        return three_squares[0]
      else
        next
      end
    end
    nil
  end

  def draw
    puts "     |     |"
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}"
    puts "     |     |"
    puts "-----|-----|-----"
    puts "     |     |"
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}"
    puts "     |     |"
    puts "-----|-----|-----"
    puts "     |     |"
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}"
    puts "     |     |"
  end
end

class PositionalBoard < Board

  def initialize
    @squares = {}
    (1..9).each{|key| @squares[key] = key}
  end

end

class Square
  INITIAL_VALUE = " "
  attr_accessor :marker
  def initialize(marker = INITIAL_VALUE)
    @marker = marker
  end

  def to_s
    @marker
  end

  def unmarked?
    marker == INITIAL_VALUE
  end
end

Player = Struct.new('Player', :marker)

# class Player
#   attr_reader :marker
#   def initialize(marker)
#     @marker = marker
#   end
# end

class TTTGame
  HUMAN_MARKER = "X"
  COMPUTER_MARKER = "O"
  FIRST_TO_MOVE = HUMAN_MARKER
  attr_reader :board, :human, :computer
  def initialize
    @board = Board.new
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
    @current_player = FIRST_TO_MOVE
  end

  def play
    clear_screen
    display_welcome_message
    loop do
      clear_screen_display_board
      loop do
        current_player_moves
        break if board.someone_won? || board.full?
        clear_screen_display_board if @current_player == HUMAN_MARKER
      end
      display_result
      break unless play_again?
      reset
      display_play_again_message
    end
    display_goodbye_message
  end

  private

  def display_welcome_message
    puts "Welcome to Tic Tac Toe!"
    puts "Use the following numbers to choose your marker's position"
    display_board_positions
    puts "Type 'Yes' when ready"
    answer = nil
    loop do
      answer = gets.chomp.downcase
      break if answer.start_with?("y")
    end
  end

  def display_board_positions
    PositionalBoard.new.draw
  end

  def display_goodbye_message
    puts "Thanks for playing!"
  end

  def clear_screen_display_board
    clear_screen
    display_board
  end

  def display_board
    puts "#{human.marker} => You || #{computer.marker} => Computer"
    board.draw
  end

  def human_moves
    puts "Choose a square"
    choice = nil
    loop do 
      choice = gets.chomp.to_i
      break if board.unmarked_keys.include?(choice)
      puts "Invalid input. Please type one of #{board.unmarked_keys.join(", ")}."
    end
    board[choice] = human.marker
  end

  def computer_moves
    board[board.unmarked_keys.sample] = computer.marker
  end

  def display_result
    clear_screen_display_board
    case board.winning_marker
    when HUMAN_MARKER
      puts "You won!"
    when COMPUTER_MARKER  
      puts "Computer won!"
    else
      puts "Board full, it's a tie!"
    end
  end

  def play_again?
    puts "Do you wnat to play again?"
    answer = nil
    loop do
      answer = gets.chomp.downcase
      break if answer.start_with?("y") || answer.start_with?("n")
      puts "Invalid input"
    end
    return true if answer.start_with?("y")
    return false if answer.start_with?("n")
  end

  def clear_screen
    system 'cls'
  end

  def reset
    board.reset
    @current_player = FIRST_TO_MOVE
  end

  def display_play_again_message
    clear_screen
    puts "Resetting board..."
    sleep 2
    clear_screen
  end

  def current_player_moves
    if @current_player == HUMAN_MARKER
      human_moves
      @current_player = COMPUTER_MARKER
    else
      computer_moves
      @current_player = HUMAN_MARKER
    end
  end
end

TTTGame.new.play
