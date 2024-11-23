# Create a superclass called Vehicle for your MyCar class to inherit from and move the behavior that isn't specific to the MyCar class to the superclass. Create a constant in your MyCar class that stores information about the vehicle that makes it different from other types of Vehicles.

# Then create a new class called MyTruck that inherits from your superclass that also has a constant defined that separates it from the MyCar class in some way.

module Computer
    def play_music(genre)
        puts "Now playing #{genre}"
    end
end

class Vehicle
    attr_accessor :num_of_vehicles, :year, :color, :make
    
    @@num_of_vehicles = 0
    
    def initialize(year, color, make)
        @@num_of_vehicles += 1
        @year = year
        @color = color
        @make = make
    end

    def self.how_many
        @@num_of_vehicles
    end

    def move
        puts "#{make} has moved"
    end

    def how_many_wheels?
        "This vehicle has "
    end

    def info
        "#{year}, #{color}, #{make}"
    end

    def age
        "#{self.make.capitalize} is #{years_old} years old."
    end

    private

    def years_old
        Time.now.year - self.year
    end
end

class MyCar < Vehicle
    include Computer

    NUM_OF_WHEELS = 4

    attr_accessor :type

    def initialize (year, color, make, type)
        super(year, color, make)
        @type = type
    end

    def how_many_wheels?
        super + "#{NUM_OF_WHEELS}"
    end

    def info
        super + ", #{type.capitalize}"
    end

end

class MyTruck < Vehicle
    NUM_OF_WHEELS = 8

    attr_accessor :fuel

    def initialize (year, color, make, fuel)
        super(year, color, make)
        @fuel = fuel
    end

    def info
        super + ", #{fuel}"
    end

end

audia4 = MyCar.new(1992, 'blue', 'Audi', 'coupe')
puts audia4.info
audia4.play_music("rock")

semitruck = MyTruck.new(2020, 'silver', 'Mercedes', 'gas')
semitruck.move
puts semitruck.info

pickup = MyTruck.new(2000, 'black', 'Mitsubishi', 'diesel')
puts pickup.fuel

puts Vehicle.how_many

puts audia4.age
puts semitruck.age
puts pickup.age
