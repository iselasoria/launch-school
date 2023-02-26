=begin 
* DONE 18m19s
The prime numbers are not regularly spaced. For example from 2 to 3 the step is 1. From 3 to 5 the step is 2. From 7 to 11 it is 4. Between 2 and 50 we have the following pairs of 2-steps primes:

3, 5 - 5, 7, - 11, 13, - 17, 19, - 29, 31, - 41, 43

We will write a function step with parameters:

`g` (integer >= 2) which indicates the step we are looking for,

`m` (integer >= 2) which gives the start of the search (m inclusive) ==

`n` (integer >= m) which gives the end of the search (n inclusive)

In the example above step(2, 2, 50) will return [3, 5] which is the first pair between 2 and 50 with a 2-steps.

So this function should return the first pair of the two prime numbers spaced with a step of g between the limits `m`, `n` if these g-steps prime numbers exist otherwise nil or null or None or Nothing or [] or "0, 0" or {0, 0} or 0 0 or "" (depending on the language).

Examples:
step(2, 5, 7) --> [5, 7] or (5, 7) or {5, 7} or "5 7"

step(2, 5, 5) --> nil or ... or [] in Ocaml or {0, 0} in C++

step(4, 130, 200) --> [163, 167] or (163, 167) or {163, 167}

See more examples for your language in "TESTS"

Remarks:
([193, 197] is also such a 4-steps primes between 130 and 200 but it's not the first pair).

step(6, 100, 110) --> [101, 107] though there is a prime between 101 and 107 which is 103; the pair 101-103 is a 2-step.

Notes:
The idea of "step" is close to that of "gap" but it is not exactly the same. For those interested they can have a look at http://mathworld.wolfram.com/PrimeGaps.html.

A "gap" is more restrictive: there must be no primes in between (101-107 is a "step" but not a "gap". Next kata will be about "gaps":-).

For Go: nil slice is expected when there are no step between m and n. Example: step(2,4900,4919) --> nil


I: three integers first is step, second is floor of range, third is ceilign fo range 
O: array of two integers 

Rules:
- we work with a range of `m..n`
- steps, not gaps! meaning we can have other primes in the step 
- floor and ceiling are both inclusive 
- return nil if there are no two numbers that give the expected step 

Goal: return the two prime numbers in a sequence of primes between `n` and `m` that have a step of `g`. 

Examples:
step(2,100,110)
primes between 100 and 110: 101 103 105 107 109
steps between primes:          2.  2   2.  2
return the first pair that qualifies: [101, 103]

step(2, 5, 5)
primes between 5..5 
steps:  none because this is not a range, it's a single number 
return nil 

step(6, 100, 110)
primes in range:      101 103 105 107 109
steps between primes:    2   2   2   2 
                           4      6   8
                           ...... each number gets calculated to each other number 
                    
Data Structures:
I: three integers 
Interim: arrays 
O: array 

Algorithm:
- generate a range from second to third argument, inclusive both 
  - select only primes 
- generate all possible pairs amonst the numbers in the primes array 
- transform the array to calculate the difference
  - select the first that is equal to first argument 
=end 
require 'prime'

def step(step_num, floor_num, ceil_num)
  primes_arr = (floor_num..ceil_num).to_a.select {|num| num.prime?}

  pairs_arr = primes_arr.combination(2).to_a

  pairs_arr.select do |pair| 
    step = (pair[0] - pair[1]).abs 
    step == step_num
  end.first

end

# test cases

p step(2,100,110) == [101, 103]
p step(4,100,110) == [103, 107]
p step(6,100,110) == [101, 107]
p step(8,300,400) == [359, 367]
p step(10,300,400) == [307, 317]
