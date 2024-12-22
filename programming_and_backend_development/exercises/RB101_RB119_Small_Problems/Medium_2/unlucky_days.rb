=begin
Write a method that returns the number of Friday the 13ths in the year given by an argument. You may assume that the year is greater than 1752 (when the United Kingdom adopted the modern Gregorian Calendar) and that it will remain in use for the foreseeable future.
=end

require 'date'

def friday_13th(year)
  count = 0
  start_date = Date.new(year)
  until start_date == Date.new(year + 1)
    count += 1 if start_date.friday? && start_date.mday == 13
    start_date = start_date.next
  end
  count
end

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2
