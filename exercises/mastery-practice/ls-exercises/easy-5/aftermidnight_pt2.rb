=begin 
* DONE 20m
As seen in the previous exercise, the time of day can be represented as the number of minutes before or after midnight. If the number of minutes is positive, the time is after midnight. If the number of minutes is negative, the time is before midnight.

Write two methods that each take a time of day in 24 hour format, and return the number of minutes before and after midnight, respectively. Both methods should return a value in the range 0..1439.

You may not use ruby's Date and Time methods.

Input: string 
Output: integer 

Rules:
  - minutes before midnight
    - takes a string separated by `:` where the first element is hrs, second is minutes
  - minutes after midnight 
    - takes a string separated by `:` where the first element is hrs, second is minutes
      - hours are out of a 24 hr period
      - minutes are out of the total minutes in a day 

Algorithm:
MIN_IN_HR = 60
HRS_IN_DAY = 24
MIN_MID = minutes at midnight ---> 24 
MIN_IN_DAY = MIN_IN_HR * HRS_IN_DAY

before_midnight(str)
  - split the string at `:`
  - store the first element as hours and second as minutes 
  - if the minutes are smaller than minutes at midnight, then they are before midnight 
  - if they are larger, than MIN_IN_DAY - MIN_MID +
after_midnight(str)


=end

MIN_IN_HR = 60
HRS_IN_DAY = 24
MIN_IN_DAY = HRS_IN_DAY * MIN_IN_HR

def after_midnight(str)
  hours, minutes = str.split(':').map(&:to_i)
  (hours * MIN_IN_HR + minutes) % MIN_IN_DAY
end

def before_midnight(str)
  delta_min = MIN_IN_DAY - after_midnight(str)
  delta_min = 0 if delta_min == MIN_IN_DAY
  delta_min
end

# test cases
p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0