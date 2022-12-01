=begin 
Find the bug and fix it. Explain why it wasnt working.

def my_method(array)
  if array.empty?
    []
  elsif
    array.map do |value|
      value * value
    end
  else
    [7 * array.first]
  end
end

SOLUTION:
There was no condition passed to elsif so it was just no executing. The else condition was just not checking out 7 * 5 (which is the first element in the array in the last test cases)
was not giving 25 as the expected solution suggested it should so this was just not even relevant.
=end


def my_method(array)
  if array.empty?
    []
  else
    array.map do |value|
      value * value
    end
  end
end

p my_method([])
p my_method([3])
p my_method([3, 4])
p my_method([5, 6, 7])

=begin
EXPECTED:
[]
[21]
[9, 16]
[25, 36, 49]
=end