=begin 
* DONE 21m39s
The time of day can be represented as the number of minutes before or after 
midnight. If the number of minutes is positive, the time is after midnight. 
If the number of minutes is negative, the time is before midnight.

Write a method that takes a time using this minute-based format and 
returns the time of day in 24 hour format (hh:mm). Your method should 
work with any integer input.

You may not use ruby's Date and Time classes.

Rules:
- input is minutes
- 60 minutes in an hour
- 60 seconds in a minute
- positive number means after midnight
- negative number means before midmnight

Algorithm:
- calculate hours as minutes.divmod(60)
- calculate days as the result above / 24
=end 
MIN_IN_HR = 60
HRS_IN_DAY = 24
MIN_IN_DAY = HRS_IN_DAY * MIN_IN_HR

def time_of_day(minutes)
  hours, minutes = minutes.divmod(MIN_IN_HR)

  h = hours % HRS_IN_DAY
  m = minutes % MIN_IN_DAY

  "#{format("%02d", h)}:#{format("%02d", m)}"
end
p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"