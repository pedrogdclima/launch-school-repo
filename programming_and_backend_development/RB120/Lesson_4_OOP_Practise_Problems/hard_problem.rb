module Moveable
  attr_writer :fuel_efficiency, :fuel_capacity
  attr_reader :speed, :heading

  def range
    @fuel_capacity * @fuel_efficiency
  end

end

class WheeledVehicle
  include Moveable

  def initialize(tire_array, km_traveled_per_liter, liters_of_fuel_capacity)
    @tires = tire_array
    @fuel_efficiency = km_traveled_per_liter
    @fuel_capacity = liters_of_fuel_capacity
  end

  def tire_pressure(tire_index)
    @tires[tire_index]
  end

  def inflate_tire(tire_index, pressure)
    @tires[tire_index] = pressure
  end

end

class Auto < WheeledVehicle
  def initialize
    # 4 tires are various tire pressures
    super([30,30,32,32], 50, 25.0)
  end
end

class Motorcycle < WheeledVehicle
  def initialize
    # 2 tires are various tire pressures
    super([20,20], 80, 8.0)
  end
end

class Watercraft
  include Moveable
  attr_reader :propeller_count, :hull_count

  def initialize(num_propellers, num_hulls, km_traveled_per_liter, liters_of_fuel_capacity)
    @propeller_count = num_propellers
    @hull_count = num_hulls
    self.fuel_efficiency = km_traveled_per_liter
    self.fuel_capacity = liters_of_fuel_capacity
  end

  def range
    super + 10
  end
end

class Motorboat < Watercraft
  def initialize(km_traveled_per_liter, liters_of_fuel_capacity)
    super(1, 1, km_traveled_per_liter, liters_of_fuel_capacity)
  end
end

class Catamaran < Watercraft
end


boaty = Motorboat.new(4, 20)
unsinkable = Catamaran.new(2, 1, 5, 80)
kawasaki = Motorcycle.new()
corolla = Auto.new()
puts boaty.range, unsinkable.range, kawasaki.range, corolla.range

=begin
#My first solution

module Wheeled
  def tire_pressure(tire_index)
    @tires[tire_index]
  end

  def inflate_tire(tire_index, pressure)
    @tires[tire_index] = pressure
  end
end

class Vehicle
  attr_accessor :speed, :heading

  def initialize(km_traveled_per_liter, liters_of_fuel_capacity)
    @fuel_efficiency = km_traveled_per_liter
    @fuel_capacity = liters_of_fuel_capacity
  end

  def range
    @fuel_capacity * @fuel_efficiency
  end
end

class Auto < Vehicle
  include Wheeled

  def initialize
    # 4 tires are various tire pressures
    @tires = [30,30,32,32]
    super(50, 25.0)
  end
end

class Motorcycle < Vehicle
  include Wheeled

  def initialize
    # 2 tires are various tire pressures
    @tires = [20,20]
    super(80, 8.0)
  end
end

class Catamaran < Vehicle
  attr_reader :propeller_count, :hull_count
  attr_accessor :speed, :heading

  def initialize(num_propellers, num_hulls, km_traveled_per_liter, liters_of_fuel_capacity)
    super(km_traveled_per_liter, liters_of_fuel_capacity)
    # ... code omitted ...
  end
end

=end