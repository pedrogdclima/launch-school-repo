require 'date'

class Meetup
  @@position_hash = {
    'first' => 0,
    'second' => 1,
    'third' => 2,
    'fourth' => 3,
    'fifth' => 4
  }

  def initialize(year, month)
    @year = year
    @month = month
  end

  def day(weekday, position)
    @weekday = weekday.downcase
    @position = position.downcase
    find_day
  end

  def find_day
    possible_dates = weekdays_in_month
    which_day(possible_dates)
  rescue NoMethodError
    puts "Error", "Invalid input => #{@weekday}"
  rescue ArgumentError
    puts "Error", "Invalid input => #{@position}"
  end

  def which_day(possible_dates)
    if @@position_hash.key?(@position)
      possible_dates[@@position_hash[@position]]
    elsif @position == 'last'
      possible_dates[-1]
    elsif @position == 'teenth'
      possible_dates.find { |date| (13..19).include?(date.mday) }
    else
      raise ArgumentError
    end
  end

  def weekdays_in_month
    possible_dates = []
    last_day = Date.new(@year, @month, -1)
    Date.new(@year, @month).step(last_day) do |date|
      possible_dates << date if date.send("#{@weekday}?")
    end
    possible_dates
  end
end
