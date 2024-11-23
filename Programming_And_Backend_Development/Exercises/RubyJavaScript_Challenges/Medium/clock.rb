=begin
Create a clock that is independent of date.

You should be able to add minutes to and subtract minutes from the time represented by a given Clock object. Note that you should not mutate Clock objects when adding and subtracting minutes -- create a new Clock object.

Two clock objects that represent the same time should be equal to each other.

You may not use any built-in date or time functionality; just use arithmetic operations.
=end

# Problem
# - 24 hour clock
# - Smallest time unit is minutes
# - Only method is .at
#   - takes two argumtents, hour and minutes (default = 0)
# - Fake opertaros required
#   - equality
#   - plus (in minutes)
#   - minus (in minutes)

class Clock

  def self.at(hour, minute = 0)
    clock = new(hour, minute)
  end

  def to_s
    "#{clock_hour}:#{clock_minute}"
  end

  def ==(other)
    to_s == other.to_s
  end

  def +(minutes)
    new_clock_total_minutes = total_minutes + minutes
    self.class.new(new_clock_total_minutes/60, new_clock_total_minutes%60)
  end

  def -(minutes)
    self + (0 - minutes)
  end

  private
  attr_accessor :total_minutes

  def initialize(hour, minute)
    self.total_minutes = ((hour % 24) * 60) + minute
  end

  def clock_hour
    (total_minutes/60).to_s.rjust(2, "0")
  end

  def clock_minute
    (total_minutes%60).to_s.rjust(2, "0")
  end
end

# Start time => 2:02
# End time => 2:52
# Total time => 50