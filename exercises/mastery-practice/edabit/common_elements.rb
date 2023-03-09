# Create a method that takes two lists of numbers sorted in ascending order and returns an array of numbers that are common to both the input arrays.
# TODO Interview Prep
p common_elements([-1, 3, 4, 6, 7, 9], [1, 3]) == [3]
p common_elements([1, 3, 4, 6, 7, 9], [1, 2, 3, 4, 7, 10]) == [7, 4, 3, 1]
p common_elements([1, 2, 2, 2, 3, 4, 5], [1, 2, 4, 5]) == [5, 4, 2, 1]
p common_elements([1, 2, 3, 4, 5], [10, 12, 13, 15]) == []
p common_elements([1, 2, 2, 2, 3, 4, 5], [1, 2, 2, 4, 5]) == [5, 4, 2, 2, 1]