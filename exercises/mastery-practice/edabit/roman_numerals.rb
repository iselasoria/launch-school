# https://edabit.com/challenge/jmi5ogNr8MC8FGEez
# TODO
=begin 
Create a function that takes in a Roman numeral as a string and converts it to an integer, returning the result. The function should work for all Roman numerals representing positive integers less than 4000.

The following table shows how digits will be represented in Roman numeral notation:


Place value  1  2    3    4  5  6    7    8     9
Ones         I  II  III  IV  V  VI  VII  VIII  IX
Tens         X  XX  XXX  XL  L  LX  LXX  LXXX  XC
Hundreds     C  CC  CCC  CD  D  DC  DCC  DCCC  CM
Thousands    M  MM  MMM  -    -  -   -    -     -

I: string 
O: integer 

Rules:
- 
Examples
parse_roman_numeral("VII") ➞ 7
parse_roman_numeral("DCLXXIX") ➞ 679
parse_roman_numeral("MMMCMV") ➞ 3905
=end 

# test 
p parse_roman_numeral("I") == 1
p parse_roman_numeral("VIII") == 8
p parse_roman_numeral("XXIX") == 29
p parse_roman_numeral("LIV") == 54
p parse_roman_numeral("CCV") == 205
p parse_roman_numeral("CDXLIV") == 444
p parse_roman_numeral("CMXCIX") == 999
p parse_roman_numeral("M") == 1000
p parse_roman_numeral("MMMDCCCLXXXVIII") == 3888
p parse_roman_numeral("MMMCMX") == 3910