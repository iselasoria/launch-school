=begin
* DONE 20m 
Write a method that takes a floating point number that represents an angle between 0 and 360 degrees and returns a String that represents that angle in degrees, minutes and seconds. You should use a degree symbol (°) to represent degrees, a single quote (') to represent minutes, and a double quote (") to represent seconds. A degree has 60 minutes, while a minute has 60 seconds.

Note: your results may differ slightly depending on how you round values, but should be within a second or two of the results shown.

You should use two digit numbers with leading zeros when formatting the minutes and seconds, e.g., 321°03'07".

Rules:
- input: float representing an angle 
- minute = 60 second 
- degree = 60 minutes 


Algorithm:
MINUTES = 60 seconds 
DEGREES = 60 minutes 
SECONDS PER DEGREE = MIN_PER_DEG * SEC_PER_MIN 
get total seconds as angle * seconds per degree 


- divmod on the total seconds to get degrees and reamainig seconds  
- divmod again this time on the remaining seconds to get minutes and seconds 
- format to return the required output

=end 

DEGREE = "\xC2\xB0"
MIN_PER_DEG = 60
SEC_PER_MIN = 60
SEC_PER_DEG = MIN_PER_DEG * SEC_PER_MIN

def dms(angle)
  total_seconds = (angle * SEC_PER_DEG).round
  degrees, remaining_seconds = total_seconds.divmod(SEC_PER_DEG)
  minutes, seconds = remaining_seconds.divmod(SEC_PER_MIN)
  format(%(#{degrees}#{DEGREE}%02d'%02d"), minutes, seconds)

end

# Test cases
p dms(30) == %(30°00'00")
p dms(76.73) == %(76°43'48")
p dms(254.6) == %(254°36'00")
p dms(93.034773) == %(93°02'05")
p dms(0) == %(0°00'00")
p dms(360) == %(360°00'00") || dms(360) == %(0°00'00")