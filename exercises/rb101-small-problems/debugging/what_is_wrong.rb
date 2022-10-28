=begin
Josh wants to print an array of numeric strings in reverse numerical order. However, the output is wrong. Without removing any code, help 
Josh get the expected outcome.
=end

arr = ["9", "8", "7", "10", "11"]
p arr.sort do |x, y|
    y.to_i <=> x.to_i
  end

# Expected output: ["11", "10", "9", "8", "7"] 
# Actual output: ["10", "11", "7", "8", "9"] 

# the busg was in the precedence that binds `p` and `arr` more tightly together than `arr.sort`
# recall that `do...end` blocks have a lower precedence than `{}` blocks. So in this case we can fix the problem
# by using a {} block:

arr = ["9", "8", "7", "10", "11"]
p arr.sort { |x, y| y.to_i <=> x.to_i }