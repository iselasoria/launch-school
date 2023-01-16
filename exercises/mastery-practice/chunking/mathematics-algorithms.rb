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
# ! Name of Algorithm
# * English Breakdown
# * Ruby Breakdown