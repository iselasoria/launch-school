# return the two olderst/oldest ages within an array of ages passed in

# return the two oldest/oldest ages within the array of ages passed in.

# initialize empty arr
# read array
# grab max
# push to new arr
# remove the max
# grab new max

def two_oldest_ages(ages)
  new_arr = []

  if ages.count(ages.max) > 1
    new_arr << ages.max
    new_arr << ages.max
  else
    new_arr << ages.max
    ages.delete(ages.max)
    new_arr << ages.max
  end

  new_arr.reverse!
end



# test case
p two_oldest_ages([38, 92, 53, 78, 86, 92, 31, 55, 28, 17, 28, 50, 91, 33, 72, 15, 71, 86, 46, 40, 17, 27, 60])

p two_oldest_ages([6, 5, 83, 5, 3, 18])