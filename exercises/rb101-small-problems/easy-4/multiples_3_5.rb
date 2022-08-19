# wirte the amethod that seaches for all multiples of 3 or 5 that lie between 1 and some number,
# and then computes the sun of those multiples. For instance, if the number is 20, the result
# should be `98` (3+4+6+9+10+12+15+18+20). You can assume the argument passed is an integer greater than 1.

def multisum(num)
  full_range = Range.new(1, num).to_a
 
  multiples = full_range.select do |item|
                item % 3 == 0 || item % 5 == 0
              end
  multiples.sum
end


p multisum(20)

# test cases 
p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168