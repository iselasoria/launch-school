=begin
In the previous exercise, we developed a recursive solution to calculating the nth Fibonacci number. 
In a language that is not optimized for recursion, some (not all) recursive methods can be extremely
slow and require massive quantities of memory and/or stack space.

Ruby does a reasonably good job of handling recursion, but it isn't designed for heavy recursion; 
as a result, the Fibonacci solution is only useful up to about fibonacci(40). With higher values of nth, 
the recursive solution is impractical. (Our tail recursive solution did much better, but even that failed at around fibonacci(8200).)

Fortunately, every recursive method can be rewritten as a non-recursive (procedural) method.

Rewrite your recursive fibonacci method so that it computes its results without recursion.

=end



def fibonacci(int)
  first, last = [1, 1] # starts at 1, 1 because fibonaci(0) is just 0 anyway

  3.upto(int) do
    first, last = [last, first + last]
  end

  last
end






p fibonacci(20) == 6765
p fibonacci(100) == 354224848179261915075
p fibonacci(100_001) # => 4202692702.....8285979669707537501


# # --------
# # def fibonacci_last(nth)
# #   fibonacci(nth).to_s[-1].to_i
# # end


# def fibonacci_last(nth)
#   last_2 = [1, 1]
#   3.upto(nth) do
#     last_2 = [last_2.last, (last_2.first + last_2.last) % 10]
#   end

#   last_2.last
# end


# # p fibonacci(20) == 6765
# # p fibonacci(100) == 354224848179261915075
# # p fibonacci(100_001) # => 4202692702.....8285979669707537501

# p fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
# p fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
# p fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
# p fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
# p fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
# p fibonacci_last(123456789) # -> 4


# # last = 4324676876897 ------> 7
# # last2 = 543545465465-------> 5

# # on 3rd iteration
# # last2 = [1, 2]
# # on 4th iteration
# # last2 = [2, 3]
# # on 5th iteration 
# # last 2 = [3, 5]
# # on 6th iteration
# # last2 = [5, 8]
# # on 7th iteration
# # last2 = [8, 3]
