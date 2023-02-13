# Re-order the characters of a string, so that they are concatenated into a new string in "case-insensitively-alphabetical-order-of-appearance" order. Whitespace and punctuation shall simply be removed!
#
# The input is restricted to contain no numerals and only words containing the english alphabet letters.
#
# Example:
#
# alphabetized("The Holy Bible") # "BbeehHilloTy"
#
# I: string
# O: string
#
# Rules:
# - case does not matter for sorting but should be retained in result
# - alphabetical order
# - keep order of appearance
# - remove special chars
# - if string after removal of special chars is an empty string, return empty string
#
#
# Goal: return a new string with no spaces or puctuation that has been sorted in alphabetical order but retains the original case
#
# Examples / Model Solution:
# ""   ---> ""
# " "  ---> ""
# " a" ---> "a"
# "A b B a" ---> "AabB"
#
# Data:
# I: string
# Interim: arrays
# O: string
#
#
# Algorithm:
# - delete all but alphabet chars
# - if string is now empty, return empty
#
# - transform to an array of item downcased, and item
# - sort on the item downcased
# - retrieve the original item from the previously nested array
#
#
#

def alphabetized(str)
  str = str.delete('^a-zA-Z')
  return '' if str.empty?

  str.chars.sort_by {|item| item.downcase}
  # str.chars.map { |letter| [letter.downcase, letter] }.sort.map { |pair| pair }.join # this does not retain order of appearance
end

# test cases

p alphabetized('') == ''
p alphabetized(' ') == ''
p alphabetized('!@$%^&*()_+=-`,') == ''

# alphabetized(" a") == "a"
# alphabetized("a ") == "a"
# alphabetized(" a ") == "a"
p alphabetized('A b B a') #== 'AabB'
# alphabetized(" a b c d e f g h i j k l m n o p q r s t u v w x y z A B C D E F G H I J K L M N O P Q R S T U V W X Y Z") == "aAbBcCdDeEfFgGhHiIjJkKlLmMnNoOpPqQrRsStTuUvVwWxXyYzZ"
# alphabetized("The Holy Bible") == "BbeehHilloTy"
# alphabetized("CodeWars can't Load Today") == "aaaaCcdddeLnooorstTWy"
