=begin
n Place a value n in the "register". Do not modify the stack.
PUSH Push the register value on to the stack. Leave the value in the register.
ADD Pops a value from the stack and adds it to the register value, storing the result in the register.
SUB Pops a value from the stack and subtracts it from the register value, storing the result in the register.
MULT Pops a value from the stack and multiplies it by the register value, storing the result in the register.
DIV Pops a value from the stack and divides it into the register value, storing the integer result in the register.
MOD Pops a value from the stack and divides it into the register value, storing the integer remainder of the division in the register.
POP Remove the topmost item from the stack and place in register
PRINT Print the register value
=end

class MinilangError < StandardError; end

class InvalidTokenError < MinilangError; end

class EmptyStackError < MinilangError; end

class Minilang
  POSSIBLE_COMMANDS = %w(PUSH ADD SUB MULT DIV MOD POP PRINT)

  def initialize(str_command)
    @commands = str_command.split
    @stack = []
    @register = 0
  #   raise InvalidTokenError, "Invalid Token" if valid_commands?
  # rescue InvalidTokenError => error
  end

  def eval
    @commands.each do |command|
      command_validation(command)
    end
  rescue StandardError => e
    puts e
  end

  def command_validation(command)
    if POSSIBLE_COMMANDS.include?(command)
      send(command.downcase)
    elsif command =~ /\A[-+]?\d+\z/
      @register = command.to_i
    else
      raise InvalidTokenError, "Invalid Token: #{command}"
    end
  end

  def valid_commands?
    output = true
    @commands.each do |command|
      output = false unless POSSIBLE_COMMANDS.include?(command)
    end
    output
  end

  def push
    @stack << @register
  end

  def add
    @register += pop
  end

  def sub
    @register -= pop
  end

  def mult
    @register *= pop
  end

  def div
    @register /= pop
  end

  def mod
    @register = @register % pop
  end

  def pop
    raise EmptyStackError, "Empty Stack!" if @stack.empty?
    @register = @stack.pop
  end

  def print
    puts @register
  end
end

Minilang.new('PRINT').eval
# 0

Minilang.new('5 PUSH 3 MULT PRINT').eval
# 15

Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# 5
# 3
# 8

Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# 10
# 5

Minilang.new('5 PUSH POP POP PRINT').eval
# Empty stack!

Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# 6

Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# 12

Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# Invalid token: XSUB

Minilang.new('-3 PUSH 5 SUB PRINT').eval
# 8

Minilang.new('6 PUSH').eval
# (nothing printed; no PRINT commands)