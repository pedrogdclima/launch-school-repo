=begin
Write a program that manages robot factory settings.

When robots come off the factory floor, they have no name. The first time you boot them up, a random name is generated, such as RX837 or BC811.

Every once in a while, we need to reset a robot to its factory settings, which means that their name gets wiped. The next time you ask, it will respond with a new random name.

The names must be random; they should not follow a predictable sequence. Random names means there is a risk of collisions. Your solution should not allow the use of the same name twice.
=end

# Problem
# - In a robot factory (class) every robot gets a random name.
# - Names must be truly random, no predictable next name
# - You must be able to .reset a robot, where they get a new name
# - No robots can have the same name at any time

# Data
# - Class Robot
# - Instance methods .name, .reset

# Algorithm
# - Instanciate new robots, take no arguments
#   - constructor creates and assigns @name to name.rand
#   - name has format => AA000
#     - letter rand(64..90).chr
#     - number rand(0..999).to_s.rjust(3, "0")
# - .reset should run the random name generator again and remove the old name from the class method
# - a class method can keep track of all names used

class Robot

  @@list_of_names = []

  def name
    return @name if @name
    @name = create_name
  end

  def reset
    @@list_of_names.delete(name)
    @name = nil
    name
  end

  private

  def self.list_of_names
    @@list_of_names
  end

  def create_name
    until !@@list_of_names.include?(new_name)
      new_name = "#{get_two_letters}#{get_three_numbers}"
    end
    @@list_of_names << new_name
    new_name
  end

  def get_two_letters
    rand(65..90).chr + rand(65..90).chr
  end

  def get_three_numbers
    rand(0..999).to_s.rjust(3, "0")
  end
end

# Start time => 11:45
# Pause => 11:57
# Restart => 12:46
# End time => 1:29
# Total time => 55