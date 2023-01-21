=begin 
# TODO this is Chris's answer, solve it on your own now!
ohn and Mary want to travel between a few towns A, B, C ... Mary has on a sheet of paper a list of distances between these towns. ls = [50, 55, 57, 58, 60]. John is tired of driving and he says to Mary that he doesn't want to drive more than t = 174 miles and he will visit only 3 towns.

Which distances, hence which towns, they will choose so that the sum of the distances is the biggest possible to please Mary and John?

Example:
With list ls and 3 towns to visit they can make a choice between: [50,55,57],[50,55,58],[50,55,60],[50,57,58],[50,57,60],[50,58,60],[55,57,58],[55,57,60],[55,58,60],[57,58,60].

The sums of distances are then: 162, 163, 165, 165, 167, 168, 170, 172, 173, 175.

The biggest possible sum taking a limit of 174 into account is then 173 and the distances of the 3 corresponding towns is [55, 58, 60].

The function chooseBestSum (or choose_best_sum or ... depending on the language) will take as parameters t (maximum sum of distances, integer >= 0), k (number of towns to visit, k >= 1) and ls (list of distances, all distances are positive or zero integers and this list has at least one element). The function returns the "best" sum ie the biggest possible sum of k distances less than or equal to the given limit t, if that sum exists, or otherwise nil 

Examples:
ts = [50, 55, 56, 57, 58] choose_best_sum(163, 3, ts) -> 163

xs = [50] choose_best_sum(163, 3, xs) -> nil (or null or ... or -1 (C++, C, D, Rust, Swift, Go, ...)

ys = [91, 74, 73, 85, 73, 81, 87] choose_best_sum(230, 3, ys) -> 228

Notes:
try not to modify the input list of distances ls

=end 

=begin 
Goal: 1st input is max sum of distances, second input is number of towns to visit, and 3rd input is 'ts' which is the list of all the distances ([town1, town2, town3, town4])
input is same as in goal 
output: maximum distance that can be driven without going over the imposed limit (input 1)

rules 
return nil if not possible
all integers are positive (inputs)
answer must be <= the highest allowed number

example given above 

data structures:
arrays 

Algorithm:
  multiply all combos of 3 numbers 
    run a loop starting with 50 and 55
    50, 55, 56
    50, 56, 57
    50, 57, 58
    55, 56, 57
    55, 57, 58

  select any that are 163 or less 
  grab the largest number from that group 
  return that number 
=end 

def choose_best_sum(max_distance, city_number, list)
  first = 0 
  b_range = 1
  e_range = 2
  distance_sum = []
  
  return nil if list.length < 3

  loop do 
      distance_sum << list[first] + list[b_range] + list[e_range]
      b_range += 1
      e_range += 1
    if e_range == list.length
      first += 1
      b_range = first + 1
      e_range = first + 2
    end
    break if first == list.length - 3
  end
  distance_sum.select {|ele| ele <= max_distance}.max
end


# test cases 

ts = [50, 55, 56, 57, 58]
p choose_best_sum(163, 3, ts)== 163

ts = [50]
p choose_best_sum(163, 3, ts)== nil

ts = [91, 74, 73, 85, 73, 81, 87]
p choose_best_sum(230, 3, ts) == 228
