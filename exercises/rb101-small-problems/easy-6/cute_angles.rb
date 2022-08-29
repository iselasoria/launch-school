=begin
-----------------------INSTRUCTIONS--------------------------------------
# Write a method that takes a floating point number that represents and angle between
# 0 and 360 degrees and returns a string that represents that angle in degrees, minutes, seconds.
# You should use a degree symbol for degrees, a single quote for minutes and a double quote for seconds.
# A degree has 60 minutes, while a minute lasts 60 seconds.
# You should use leading zeros for minutes and seconds for example: 321°03'07"
# You can use the contstant below to represent 
--------------------------PROBLEM----------------------------------------
Questions: 
Input: floating point number
Output: string representing angle in degrees, minutes, and seconds
---------------------------RULES-----------------------------------------
Explicit: use leading zeros for minutes and seconds
use the constant given: DEGREE = "\xC2\xB0" for the degree symbol
Implicit: there is some math involved where the degrees integert stays the same, the remaining decimal gets multiplied
by 60, and the remaining decimal from that gets multiplied by 60 again
--------------------------EXAMPLES---------------------------------------
input: 76.73
  degrees: 76
  minutes: .73 * 60 = 43.8
  secodns: .8 * 60 = 48
  end result: 76°43'48"
=end
# ----------------------------ALGO-----------------------------------------
DEGREE = "\xC2\xB0"
MINUTES_PER_DEGREE = 60
SECONDS_PER_MINUTE = 60
SECONDS_PER_DEGREE = MINUTES_PER_DEGREE * SECONDS_PER_MINUTE

def dms(number)
  total_seconds = (number * SECONDS_PER_DEGREE).round
  degrees, remaining_seconds = total_seconds.divmod(SECONDS_PER_DEGREE)
  minutes, seconds = remaining_seconds.divmod(SECONDS_PER_MINUTE)
  format(%(#{degrees}#{DEGREE}%02d'%02d"), minutes, seconds)
  # deg = number.truncate(0)
  # min = ((number % deg) * 60).truncate(0)
  # sec = ((((number % deg) * 60) % min) * 60).truncate(0)
  # dbqt = '"'
  # "#{deg}#{DEGREE}#{min}'#{sec}#{dbqt}"

end

p dms(76.73)



# test cases
p dms(30) == %(30°00'00")
p dms(76.73) == %(76°43'48")
p dms(254.6) == %(254°36'00")
p dms(93.034773) == %(93°02'05")
p dms(0) == %(0°00'00")
p dms(360) == %(360°00'00") || dms(360) == %(0°00'00")