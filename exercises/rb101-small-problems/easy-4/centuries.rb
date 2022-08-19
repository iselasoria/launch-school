# write a method that takes a year as input and returns the century. The return value should be a string 
# that begins with the century and ends with st, nd, rd, th as appropriate.
# New centuries begin in yuears that end with 01. So, the years 1901-2000 compires the 20th century.

def century(year)
  p year.to_f
  year/100.00.round()
end


p century(1991)


# test cases 
# century(2000) == '20th'
# century(2001) == '21st'
# century(1965) == '20th'
# century(256) == '3rd'
# century(5) == '1st'
# century(10103) == '102nd'
# century(1052) == '11th'
# century(1127) == '12th'
# century(11201) == '113th'

#TODO come back to this one, try solving on your own again!