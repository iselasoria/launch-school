# write a method that takes an array of integers between 0 and 19
# and returns an array of those integers sorted based on their english word.
# for example [4,7,1] would get ordered as four, one, seven based on the words's english equivalent
ENGLISH = %w(zero one two three four 
             five six seven eight nine 
             ten eleven twelve thirteen fourteen 
             fifteen sixteen seventeen eighteen nineteen)


def alphabetic_number_sort(arr)
  arr.sort_by { |item| ENGLISH[item] }
end

p alphabetic_number_sort([2,5,7])

# test cases
p alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]

# ? This is not entirely clear, come back to this question.