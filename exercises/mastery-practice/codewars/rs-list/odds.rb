=begin 
You will be given an array of numbers. You have to sort the odd numbers in ascending order while leaving the even numbers at their original positions.

I: array 
O: array 

Rules:
- odd numbers are to be in ascending order 
- even numbers stay in original place 

Examples:
[7, 1]  =>  [1, 7]
[5, 8, 6, 3, 4]  =>  [3, 8, 6, 5, 4]
 0  1. 2. 3. 4
 o.  e. e o.  e 
 odd: [5,3] --> sorted ---> [3,5]
 evens: [8,6,4]

[9, 8, 7, 6, 5, 4, 3, 2, 1, 0]  =>  [1, 8, 3, 6, 5, 4, 7, 2, 9, 0]

[1, 2, 3, 4, 5, 6, 7, 8, 9, 0] => [1, 2, 3, 4, 5, 6, 7, 8, 9, 0]
 o  e   o e  o. e. o. e  o  e
 odd: [1,3,5,7,9]
 even: [2,4,6,8,0]



 [3,5,4,2,1]
 [_,_,4,2,_]
  3 5 1
  1 3 5
  Iterate through collection woth place holers 
    - dump into placeholder each of the odd numbers 




Data Structures: 

I: array 
Interim: array 
O: array 


Algorithm:
- initialize `odds_arr`
- iterate over array 
  - if it finds an odd number
    - dump into `odds_arr`
    - replace with a ' '
  - store this in a collection called `placeholder_arr`
- sort odds_arr
- iterate over placeholder_arr
  - when I find an empty space, 
    - set array at current index to odds_arr at currrent index

=end 


def sort_array(arr)
  odds_arr = []

  placeholder_arr = arr.map do |num|
                      if num.odd?
                        odds_arr << num
                        ' '
                      else
                        num
                      end
                    end

  odds_arr.sort!

  placeholder_arr.map do |spot|
    if spot == ' '
      odds_arr.shift
    else
      spot
    end
  end
end

p sort_array([5, 3, 2, 8, 1, 4, 11]) #== [1, 3, 2, 8, 5, 4, 11]
# p sort_array([2, 22, 37, 11, 4, 1, 5, 0]) == [2, 22, 1, 5, 4, 11, 37, 0]
# p sort_array([1, 111, 11, 11, 2, 1, 5, 0]) == [1, 1, 5, 11, 2, 11, 111, 0]
# p sort_array([1, 2, 3, 4, 5, 6, 7, 8, 9, 0]) == [1, 2, 3, 4, 5, 6, 7, 8, 9, 0]
# p sort_array([0, 1, 2, 3, 4, 5, 6, 7, 8, 9]) == [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
# p sort_array([0, 1, 2, 3, 4, 9, 8, 7, 6, 5]) == [0, 1, 2, 3, 4, 5, 8, 7, 6, 9]
# p sort_array([]) == []
# p sort_array([19]) == [19]
# p sort_array([2]) == [2]
# p sort_array([7,5]) == [5,7]
