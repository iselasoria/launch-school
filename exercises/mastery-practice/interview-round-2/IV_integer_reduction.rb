=begin
In this Kata, you will be given two integers n and k and your task is to remove k-digits from n and return the lowest number possible, without changing the order of the digits in n. Return the result as a string.

Let's take an example of solve(123056,4). We need to remove 4 digits from 123056 and return the lowest possible number. The best digits to remove are (1,2,3,6) so that the remaining digits are '05'. Therefore, solve(123056,4) = '05'.

Note also that the order of the numbers in n does not change: solve(1284569,2) = '12456', because we have removed 8 and 9.

I: two integers 
O: string 

Rules:
  - remove k digits from n 
  - don't change the order of the digits 
  - return a string of the smallest possible number you can make 

Examples:
  n    |   k  | result |
-------+------+--------+
123056 |   2  |  1056  |
123056 |   4  |   05   |
1284569|   4  |   124  |
Note:
  - substrings of legnth digits - k  OR  substrings whose sizes add up to digits - k 

DS:
- array of integers (digits) or characters
- string at the end 

Algorithm:
Helper Method: pair_size(arr)
  - generate all pairs from substrings array 
    - get the sum of their size 
    - select onoly those whose pair size is ideal 
    # ['1','056']
    - if their joined size is ideal, return true 

Main Method: solve(n, k)
  - make a call to gen_subs(n)
  - iterate over substrings 
    - if they are a lenght of digits.length - k 
      - take whole substring and push to valid_subs
    - othewise if their sizes add up to digits.length - k ---> helper: pair_size(arr)
      - join substrings together  and push to valid_subs

- grab the maximum substring and return 
=end 

def pair_size(arr, ideal)
  pairs = arr.permutation(2).to_a

  pairs.select! {|pair| pair[0].size + pair[1].size == ideal}

  pairs.select! {|pair| arr.index(pair[1]) > arr.index(pair[0])}

  

  pairs.map! do |par|
    # skip non-uniques because substrings sholdnt contain dupes if digits are unique 
    next if par.flatten.join.size != par.flatten.uniq.size 

    if par[0] == [0] &&  (par[0].join + par[1].join).size != ideal
      (par[1].join)
    else
     par[0].join + par[1].join
    end
  end.compact! # <--- squeeze out the nils created by the map
  # seelct only ideal size 
  # pairs.select! {|int_equivalent| int_equivalent.digits.size == ideal}#.min
  pairs.min
  
end

# test_arr = [[1], [1, 2], [1, 2, 3], [1, 2, 3, 0], [1, 2, 3, 0, 5], [1, 2, 3, 0, 5, 6], [2], [2, 3], [2, 3, 0], [2, 3, 0, 5], [2, 3, 0, 5, 6], [3], [3, 0], [3, 0, 5], [3, 0, 5, 6], [0], [0, 5], [0, 5, 6], [5], [5, 6], [6]]

# p pair_size(test_arr, 4)

def solve(n, k)
  num = n.digits.reverse
  ideal_size = num.size - k 
  subs = []
  (0...num.size).each do |starting|
    (starting...num.size).each do |ending|
      sub = num[starting..ending]
      subs << sub 
    end
  end
  pair_size(subs, ideal_size)
end


# test cases 


p solve(123056,1) == '12056'
p solve(123056,3) == '056'
p solve(123056,4) == '05'
p solve(1284569,1) == '124569'
p solve(1284569,2) == '12456'
p solve(1284569,3) == '1245'
p solve(1284569,4) == '124'
p solve(123056,2) == '1056'