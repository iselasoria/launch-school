=begin
The reverse_sentence method should return a new string with the words of its argument in reverse order,
without using any of Ruby's built-in reverse methods. However, the code below raises an error.
Change it so that it behaves as expected.
=end
def reverse_sentence(sentence)
  words = sentence.split(' ')
  p words

  reversed_words = []

  i = 0
  while i < words.length
    reversed_words = [words[i]] + reversed_words # original reversed_words = words[i] + reversed_words
    i += 1
  end

  reversed_words.join(' ')
end

p reverse_sentence('how are you doing')
# expected output: 'doing you are how'

# The bug was on line 13, because words[i] was a string, and then we were trying to concatenate it with an array, and the data types were not meshing well together so
# we wrap the words[i] around a set of brackets [words[i]] to make it compatible with the reversed_words.