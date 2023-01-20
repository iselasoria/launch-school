=begin 
A permutation is the choice of r things from a set of n things without replacement and where the order matters.

P ---> permutation (as a function of n and r)
n ---> the big number of available items
r ---> the desired groups size 

nPr =   n!
      ------
      (n-r)!

nPr =   24            24
      ------ ====>   ----  ===> 24
      (24-3)!         21


Breakdown: factorial!
|   input: 4!  | what's happening?  |         code          |   result  |
+--------------+--------------------+-----------------------+-----------+
| range:       |       1-4          |  (0..n).to_a          | [1,2,3,4] |
| factorial    |   1 * 2 * 3 * 4    | [1,2,3,4].inject(&:*) |     24    |
+--------------+--------------------+-----------------------+-----------+
=end

list = [1,2,3,4]
perm = list.permutation(3).to_a

perm2 = []
list.permutation(3) {|num| perm2 << num}

perm3 = []
list.permutation {|num| perm3 << num}


# puts "Without a block:"
# p perm.sort
# p perm.size
# puts "With a block:"
# p perm2.sort
# p perm2.size
# puts "With a block and no n"
# p perm2.sort
# p perm2.size
# p perm == perm2


# When called without a block, permutation returns the same number of possible scenarios as n! where n is the length of the collection
a = [1, 2, 3]
# [1,2,3][1,3,2][2,3,1][2,1,3][3,1,2][3,2,1]
p a.permutation.to_a