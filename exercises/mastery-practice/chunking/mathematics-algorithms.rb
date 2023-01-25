################################################################################################
# ! Letter Counter
# * English Breakdown
# * Ruby Breakdown

def word_sizes(str)
  counts = Hash.new(0)

  str.split.each do |word|
    counts[word.size] += 1
  end

  counts
end # todo


################################################################################################
# ! Generating Permutations
# * English Breakdown
# we return the original string, if the input was empty 
# break up the string into its characters 
# we want to move through the characters in the string starting from index 0
# we want to end the iteration at the last character, so str.size exclusive 
# we use flat_map so that we flatten the array at once 
# the block parameter becomes the moving index
# we then want to break up the string into the gollowing:
#   - current character which is string at moving index 
#   - remaining characters --> before and after the current character
#                              string from 0 up to current characters 
#                              string from current character + 1 up to the end 
# combined these three pieces are each a permutation

# last step is to make a recursive call to permutation and pass in the remaining chracters 
# now we concatenate each current character with the remaining one

# * Ruby Breakdown

# deconstruct the permutations function
def permutation(string)
  return [''] if string.empty?

  chrs = string.chars
  (0...string.size).flat_map do  |moving_idx|
    cur_char, remaining_chars = string[moving_idx], string[0...moving_idx] + string[moving_idx+1..-1] 

    permutation(remaining_chars).map do  |sub| 
      cur_char + sub
    end
  end
end



p permutation('abc')

################################################################################################
# ! Name of Algorithm
# * English Breakdown
# * Ruby Breakdown