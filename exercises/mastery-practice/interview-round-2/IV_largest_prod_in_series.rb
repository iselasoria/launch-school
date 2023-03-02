=begin 
* DONE 11m35s
Complete the greatestProduct method so that it'll find the greatest product of five consecutive digits in the given string of digits.

For example:

greatestProduct("123834539327238239583") // should return 3240
The input string always has more than five digits.

Adapted from Project Euler.

I: string 
O: integer 

Rules:
- five consecutive 
  - product 
  - largest 

Examples:
123834539327238239583
12383 45393 27238 23958 3
144   1620  672   2160 WE NEED TO LOOK AT SUBARRAYS, NOT CONSECTUTIVE FIVES

Data Structures:
arrays 

Algorithm:
Helper Method: gen_subs(str)
  - get all subarrays of length 5 only

Main Method: greatest_product(str)
  - make a call to gen_subs and store in `subarrays`
  - iterate over subarrays 
    - with each iteration 
      - transform the number to integer and perform a product on the sub array 
  - return the largest of the transformations 

=end 
def gen_subs(str)
  subs = []
  (0...str.size).each do |st|
    (st...str.size).each do |nd|
      slice = str[st..nd]
      subs << slice if slice.size == 5
    end
  end
  subs 
end

def greatest_product(str)
  subs = gen_subs(str)

  subs.map { |tiny_arr| tiny_arr.chars.map(&:to_i).inject(:*) }.max
end


# test cases

p greatest_product("123834539327238239583") ==  3240
p greatest_product("395831238345393272382") == 3240
p greatest_product("92494737828244222221111111532909999") == 5292
p greatest_product("92494737828244222221111111532909999") == 5292
p greatest_product("02494037820244202221011110532909999") == 0