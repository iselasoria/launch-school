################################################################################################
# ! Generate All Substrings
# * English Breakdown
# Initialize a variable to catch all the substrings we will generate
# Start iteration from the index 0 of the string and going up to but not including, the last characrter in the string--> this is the moving starting char
# A second level of iteration goes from the starting moving index above, to the end of the string 
# set a variable to catch the current susbtring 
# define a current substring as the slice of the original string starting at the starting index, and going up to the ending index, exclusive.
# push all substrings into the substrings variable initialzied in the first step
# return all the substrings 

# * Ruby Breakdown

def gen_subs(str)
  subs = []
  (0...str.size).each do |starting|
    (starting...str.size).each do |ending|
      current_sub = str[starting..ending]
      subs << current_sub
    end
  end
  subs
end

p gen_subs('madam')


# * Sreamlined Substrings

# Only Vowels
# break if the current substring that is being generated does not have all its characters in the vowels array
def gen_subs(str)
  subs = []
  (0...str.size).each do |starting|
    (starting...str.size).each do |ending|
      current_sub = str[starting..ending]
      break if !current_sub.chars.all? { |letter| %(a e i o u).include?(letter.downcase)}
      subs << current_sub
    end
  end
  subs
end

p gen_subs('Onomatopeia')

# Only Consonants
# select only those substrings for which the block returns true
  # the block checks that all of the substring's characters are not found in the vowels--> that none of them are found in the vowels
def gen_subs(str)
  subs = []
  (0...str.size).each do |starting|
    (starting...str.size).each do |ending|
      current_sub = str[starting..ending]
      subs << current_sub
    end
  end
  subs.select do |sub|
    sub.chars.all? { |letter| !%(a e i o u).include?(letter.downcase)}
  end

end

p gen_subs('Onomatopeia')

