=begin
Create an object-oriented number guessing class for numbers in the range 1 to 100, with a limit of 7 guesses per game.
=end

class GuessingGame

  def initialize(low_num, high_num)
  @high_num = high_num
  @low_num = low_num
  @range = (low_num..high_num)
  end

  def play
    reset
    until @guesses_left == 0 do
      display_remaining_guesses
      player_turn
      response_to_guess
      sleep 1
      break if @correct_number == @current_guess
    end
    player_lost if @guesses_left == 0
    display_goodbye_message
  end

  def reset
    @guesses_left = Math.log2(@high_num - @low_num).to_i + 1
    @correct_number = rand(@range)
    @current_guess = nil
  end

  def display_goodbye_message
    puts "Thanks for playing! Goodbye!"
  end

  def display_remaining_guesses
    puts "You have #{@guesses_left} guesses left."
  end

  def player_turn
    puts "Enter a number between #{@low_num} and #{@high_num}"
    input = nil
    until valid_guess?(input) do
      input = gets.chomp.to_i
    end
    @current_guess = input
    @guesses_left -= 1
  end

  def valid_guess?(input)
    return false if input == nil
    if !(@range.include?(input))
      puts "That number is not in the range. Try again"
      return false
    end
    true
  end

  def response_to_guess
    if @current_guess > @correct_number
      puts "Your guess was too high"
    elsif @current_guess < @correct_number
      puts "Your guess was too low"
    else
      player_won
    end
  end

  def player_won
    puts "You guessed correctly!"
  end

  def player_lost
    puts "You're out of guesses... You lost!"
  end
end

game = GuessingGame.new(1,5)
game.play
game.play