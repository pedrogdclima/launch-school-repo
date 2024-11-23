=begin
Consider the following classes:

class Car
  attr_reader :make, :model

  def initialize(make, model)
    @make = make
    @model = model
  end

  def wheels
    4
  end

  def to_s
    "#{make} #{model}"
  end
end

class Motorcycle
  attr_reader :make, :model

  def initialize(make, model)
    @make = make
    @model = model
  end

  def wheels
    2
  end

  def to_s
    "#{make} #{model}"
  end
end

class Truck
  attr_reader :make, :model, :payload

  def initialize(make, model, payload)
    @make = make
    @model = model
    @payload = payload
  end

  def wheels
    6
  end

  def to_s
    "#{make} #{model}"
  end
end

Refactor these classes so they all use a common superclass, and inherit behavior as needed.
=end

class Vehicle
    attr_reader :make, :model

    def initialize(make, model)
        @make = make
        @model = model
    end

    def to_s
        "#{make} #{model}"
    end

    def wheels
        self.class::NUM_OF_WHEELS
    end

end

class Car < Vehicle

    NUM_OF_WHEELS = 4

end
  
class Motorcycle < Vehicle

    NUM_OF_WHEELS = 2

end
  
class Truck < Vehicle
    attr_reader :payload
    
    NUM_OF_WHEELS = 6

    def initialize(make, model, payload)
      super(make, model)
      @payload = payload
    end

end

civic = Car.new('Honda', 'Civic')
ninja = Motorcycle.new('Kawasaki', 'Ninja')
f150 = Truck.new('Ford', 'F-150', 1000)

puts civic, ninja, f150
p civic.wheels