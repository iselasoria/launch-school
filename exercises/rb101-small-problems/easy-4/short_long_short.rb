# write a method that takes two strings as arguments, determines the longest of the two, and 
# returns the result of concatenating short string, long string, short string again.
# assume strings are different lengths.

def short_long_short(string1, string2)
  short = ''
  long = ''
  if string1.length > string2.length
    short = string2
    long = string1
  else
    short = string1
    long = string2
  end
  # p "Short:  #{short}"
  # p "Long: #{long}"
  short + long + short
end

p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"
