require 'date'

=begin
Write a method that returns the number of Friday the 13ths in the year given by an argument.
You may assume that the year is greater than 1752 (when the United Kingdom adopted the modern Gregorian Calendar)
and that it will remain in use for the foreseeable future.

---------P
Input: integer
Output: integer
---------E
initiating a time object:
t = Date.new(2015, 12, 31)
p t.friday?
p t.day

---------D/M
---------A
- import the date class
- initiate a start date object
- initiate an end date object
  - extract the day number from the date object
  - dertermine if the day is a friday
  - do this for beginning and end dates jan 1st to dec 31st
  - iterate through all the days in the calendar
    - check if both of the previous conditions are true
      - if they are
        - count the days
=end


def friday_13th(year)
  unlucky = 0
  total_fridays = 0 # should be roughly 26
  total_13ths = 0 #should be 12
  t1 = Date.new(year, 1, 1)
  t2 = Date.new(year, 12, 31)

  all_days = (t1..t2).to_a
  
  all_days.each do |jour|
    if jour.friday? && jour.day == 13
      unlucky += 1
    end
  end
  unlucky
end


# test cases
p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2