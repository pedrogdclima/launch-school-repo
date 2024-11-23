=begin
Consider the following program.

class Pet
  def initialize(name, age)
    @name = name
    @age = age
  end
end

class Cat < Pet
end

pudding = Cat.new('Pudding', 7, 'black and white')
butterscotch = Cat.new('Butterscotch', 10, 'tan and white')
puts pudding, butterscotch

Update this code so that when you run it, you see the following output:

My cat Pudding is 7 years old and has black and white fur.
My cat Butterscotch is 10 years old and has tan and white fur.
=end

class Pet
    def initialize(name, age)
        @name = name
        @age = age
    end

    def to_s
        "My #{self.class.to_s.downcase} #{@name} is #{@age} years old."
    end
end

class Cat < Pet
    def initialize(name, age, fur_coat)
        super(name, age)
        @colour = fur_coat
    end

    def to_s
        super[0..-2] + " and has #{@colour}."
    end
end

class Dog < Pet
end

  
pudding = Cat.new('Pudding', 7, 'black and white')
butterscotch = Cat.new('Butterscotch', 10, 'tan and white')
rex = Dog.new('Rex', 9)
puts pudding, butterscotch, rex

# My cat Pudding is 7 years old and has black and white fur.
# My cat Butterscotch is 10 years old and has tan and white fur.