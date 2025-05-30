=begin
You have the following classes.

class Person
  attr_reader :name

  def initialize(name)
    @name = name
  end

  private

  def gait
    "strolls"
  end
end

class Cat
  attr_reader :name

  def initialize(name)
    @name = name
  end

  private

  def gait
    "saunters"
  end
end

class Cheetah
  attr_reader :name

  def initialize(name)
    @name = name
  end

  private

  def gait
    "runs"
  end
end

You need to modify the code so that this works:

mike = Person.new("Mike")
mike.walk
# => "Mike strolls forward"

kitty = Cat.new("Kitty")
kitty.walk
# => "Kitty saunters forward"

flash = Cheetah.new("Flash")
flash.walk
# => "Flash runs forward"

You are only allowed to write one new method to do this.
=end

module Moveable
    def walk
        puts "#{name} #{gait} forward"
    end
end

class Person
    include Moveable
    attr_reader :name
  
    def initialize(name)
        @name = name
    end
  
    private
  
    def gait
        "strolls"
    end
end

class Cat
    include Moveable
    attr_reader :name
  
    def initialize(name)
        @name = name
    end
  
    private
  
    def gait
        "saunters"
    end
end
  
class Cheetah
    include Moveable
    attr_reader :name
  
    def initialize(name)
        @name = name
    end
  
    private
  
    def gait
        "runs"
    end
end

mike = Person.new("Mike")
mike.walk
# => "Mike strolls forward"

kitty = Cat.new("Kitty")
kitty.walk
# => "Kitty saunters forward"

flash = Cheetah.new("Flash")
flash.walk
# => "Flash runs forward"