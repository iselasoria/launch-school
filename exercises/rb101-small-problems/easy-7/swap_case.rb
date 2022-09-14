=begin
-----------------------INSTRUCTIONS--------------------------------------
Write a method that takes a string as an argument and returns a new string in which every
uppercase letter is replace by its lowercase version, and every lowercase letter is replaced
by its uppercase version. All other characters should be unchanged. you may not use String#swapcase
--------------------------PROBLEM----------------------------------------
Questions:
Input: a string object
Output: new string object
---------------------------RULES-----------------------------------------
Explicit: swap the lettercase for the alphabetic characters in a string
Implicit: non-alphanumeric characters get ignored but not removed
--------------------------EXAMPLES---------------------------------------

# word = "burbujita"
# p word.swapcase

- read string object
- iterate over the string 


=end
# ----------------------------ALGO----------------------------------------
CAPS = ('A'..'Z').to_a
LOWS = ('a'..'z').to_a
def swapcase(str)
  words = str.split()
  new_arre = words.map do |word|
              word.chars.map do |ch|
                if CAPS.include?(ch)
                  ch.downcase
                elsif LOWS.include?(ch)
                  ch.upcase
                else
                  ch
                end
              end
            end

  final_arre = new_arre.map do |item|
                item.join()
              end
  final_arre[0]  # TODO come back to this. Take the string outside the array
end

swapcase("Isela Soria")
# test cases
p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') #== 'tONIGHT ON xyz-tv'