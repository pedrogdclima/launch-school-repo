# RPS Game

class Player
  attr_accessor :move, :name, :score

  MOVE_OPTIONS = ['rock', 'paper', 'scissors']

  def initialize()
    @move = nil
    set_name
    @score = 0
  end

  def increment_score
    self.score += 1
  end
end

class Human < Player
  def set_name
    temp_name = ""
      loop do
        puts "What's your name?"
        temp_name = gets.chomp
        break if !temp_name.empty?
        puts "Name can't be an empty string. Try again!"
      end
    self.name = temp_name
  end

  def choose
    choice = nil
    puts "Are you going to play rock, paper, or scissors?"
    until MOVE_OPTIONS.include?(choice) do
      sleep 1
      puts "Invalid value! Please try again" if choice != nil
      choice = gets.chomp
    end
    self.move = choice
  end
end

class Computer < Player
  def set_name
    self.name = 'AI'
  end

  def choose
    self.move = MOVE_OPTIONS.sample
  end
end

class RPSGame
  attr_reader :human, :computer

  def initialize
    display_welcome_message
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors!"
    sleep 1
  end

  def display_goodbye_message
    puts "Thanks for playing!"
    sleep 1
  end

  def display_score
    puts "#{human.name} won #{human.score} times"
    sleep 1
    puts "#{computer.name} won #{computer.score} times"
    sleep 1
  end

  def display_winner
    puts "#{human.name} chose " + human.move
    sleep 1
    puts "#{computer.name} chose #{computer.move}"
    sleep 1
    case who_won(human, computer)
    when false
      puts "It was a tie!"
    when human
      human.increment_score
      puts "#{human.name} won!"
    when computer
      computer.increment_score
      puts "#{computer.name} won!"
    end
    sleep 1
  end

  def who_won (player1, player2)
    return false if player1.move == player2.move
    case player1.move
    when "rock"
      return player1 if player2.move == "scissors"
      player2
    when "paper"
      return player1 if player2.move == "rock"
      player2
    when "scissors"
      return player1 if player2.move == "paper"
      player2
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again?"
      answer = gets.chomp.downcase
      sleep 1
      break if answer == 'yes' || answer == 'no'
      puts "Invalid answer. Yes or no."
      sleep 1
    end
    return (answer == 'yes' ? true : false)
  end

  def play
    loop do
      human.choose
      computer.choose
      display_winner
      display_score
      break if !play_again?
    end
    display_goodbye_message
  end
end

RPSGame.new.play
