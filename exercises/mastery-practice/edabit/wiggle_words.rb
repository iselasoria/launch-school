=begin
* DONE 16m23s
Create a function that returns an array of the given string but offset by spaces. Here are some more precise instructions:

Keep adding spaces on the left until you have the same number of spaces as the word length.
Then keep removing spaces until you reach the original word.
Below are some helpful examples!


I: string 
O: array of strings 

Rules:
- the word is to be padded by spaces on the left until I have as many spaces as there are characters in the word 
- at the height, start coming back down 

Examples:
wiggle_string("hello") == [
  "hello", * no space
  " hello", * 1 space
  "  hello", * 2 spaces 
  "   hello", ...
  "    hello",
  "     hello" * word size: 5, spaces: 5
  "    hello", * 4 spaces 
  "   hello", * 3 spaces 
  "  hello",
  " hello",
  "hello"
]

DS:
I: string 
Interim: arrays 
O: array 

Algorithm: 
- init "result_arr"
- iterate from the 0 index to end of string 
  - with each iteration 
  - init space_multiplier and set to space times index
    - define padster as the string, right justified with spaces and the index as the multiplier 
    - push padster to results_arr   
    - count down from str size down to 0
      multiplier set as above
      paster set as above 
      - push padster to result_arr
- return results_arr

=end
def wiggle_string(str)
  results_arr = []

  0.upto(str.size-1) do |idx|
    space_multiplier = " " * idx
    padster = space_multiplier + str
    results_arr << padster
  end
  str.size.downto(0) do |idx|
    space_multiplier = ' ' * idx
    padster = space_multiplier + str 
    results_arr << padster
  end
  results_arr
end

# test cases 
p wiggle_string("hello") == [
  "hello",
  " hello",
  "  hello",
  "   hello",
  "    hello",
  "     hello",
  "    hello",
  "   hello",
  "  hello",
  " hello",
  "hello"
]

p wiggle_string("EDABIT") == [
  "EDABIT",
  " EDABIT",
  "  EDABIT",
  "   EDABIT",
  "    EDABIT",
  "     EDABIT",
  "      EDABIT",
  "     EDABIT",
  "    EDABIT",
  "   EDABIT",
  "  EDABIT",
  " EDABIT",
  "EDABIT"
]

p wiggle_string("Wiggle Time") == [
  "Wiggle Time",
  " Wiggle Time",
  "  Wiggle Time",
  "   Wiggle Time",
  "    Wiggle Time",
  "     Wiggle Time",
  "      Wiggle Time",
  "       Wiggle Time",
  "        Wiggle Time",
  "         Wiggle Time",
  "          Wiggle Time",
  "           Wiggle Time",
  "          Wiggle Time",
  "         Wiggle Time",
  "        Wiggle Time",
  "       Wiggle Time",
  "      Wiggle Time",
  "     Wiggle Time",
  "    Wiggle Time",
  "   Wiggle Time",
  "  Wiggle Time",
  " Wiggle Time",
  "Wiggle Time"
]
