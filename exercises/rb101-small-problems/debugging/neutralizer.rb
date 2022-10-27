=begin
We wrote a neutralize method that removes negative words from sentences. However, it fails to remove all of them. What exactly happens?
=end

def neutralize(sentence)
  words = sentence.split(' ')
  words.each do |word|
    words.reject! {|word| negative?(word)} # original was: words.delete(word) if negative?(word)
  end

  words.join(' ')
end

def negative?(word)
  [ 'dull',
    'boring',
    'annoying',
    'chaotic'
  ].include?(word)
end

puts neutralize('These dull boring cards are part of a chaotic board game.')
# Expected: These cards are part of a board game.
# Actual: These boring cards are part of a board game.


# The bug was in that delete was mutating the array but since each works based on index, if the first element was deleted, index zero is already iterated over.
# So now even though our new array is one element shorter and the first was deleted now the new shorter array has at its index zero what used to be index 1, but each
# doesn't know, it just knows that it already passed index 0 so not it goes to index 1 which is index 2 in the original array.