################################################################################################
# ! Generate All Substrings
# * English Breakdown
# Initialize a variable to catch all the substrings we will generate
# Start iteration from the index 0 of the string and going up to the last characrter in the string--> this is the moving starting char
# A second level of iteration goes from the starting moving index above, to the end of the string 
# set a variable to catch the current susbtring 
# define a current substring as the slice of the original string starting at the starting index, and going up to the ending index, inclusive.
# push all substrings into the substrings variable initialzied in the first step
# return all the substrings 

# * Ruby Breakdown

def gen_subs(str)
  subs = []
  (0..str.size).each do |starting|
    (starting..str.size).each do |ending|
      current_sub = str[starting..ending]
      subs << current_sub
    end
  end
  subs
end

p gen_subs('madam')