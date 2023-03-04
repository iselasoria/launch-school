=begin 
* DONE 17m
Complete the method that takes a hash list of users, and find the nexus: the user whose rank is the closest (or?) is equal to his honor. Return the rank of this user. For each user, the key is the rank and the value is the honor.

If nobody has an exact rank/honor match, return the rank of the user who comes closest. If there are several users who come closest, return the one with the lowest rank (numeric value). The hash will not necessarily contain consecutive rank numbers; return the best match from the ranks provided.

Example
         rank    honor
users = {  1  =>  93,
          10  =>  55,
          15  =>  30,
          20  =>  19,    <--- nexus
          23  =>  11,
          30  =>   2 }


I: hash 
O: integer 

Rules:
- keys is rank 
- value is honor 

Goal: return the rank of the user whose rank is closes to his honor


Examples:
         rank    honor     diff 
users = {  1  =>  93,       92
          10  =>  55,       45
          15  =>  30,       15
          20  =>  19,        1 <---- smallest number, so return 20
          23  =>  11,       12
          30  =>   2 }      28

DS: 
hash 
arrays 
integer 

Algorithm:
- init diffs_hash = {} --> {5=> 2, 6 => 10..}
- iterate over the users_hash 
  - for each user (in the hash)
    - get the absolute value of the difference between key and val (this is diff)
    - set in diffs_hash:
      - the diff as the value (in hash key is *unique)
      - set key as the rank 


- min by the difference (get smallest) # { 5=>2}
  - return the keys 
=end

def nexus(users_hash)
  diffs_hash = {}

  users_hash.each do |rank, honor|
    diff = (rank-honor).abs
    diffs_hash[rank] = diff
  end
  # handle cases where there is a tie in an if statement 
  # if its one, then mind by
  potential_winners = diffs_hash.min_by(2) {|rank, diff| diff}
  if potential_winners.size == 1
    potential_winners
  else
    diffs_hash.min_by(2) {|rank, diff| diff}.to_h.min_by {|r, d| r}[0]
  end
end

# test cases
p nexus({1 => 3, 3 => 3, 5 => 1}) == 3
p nexus({1 => 10, 2 => 6, 3 => 4, 5 => 1}) == 3

p nexus({ 1=>93, 10=>55, 15=>30, 20=>19,23=>11,30=> 2 }) == 20 
p nexus({1=>10000, 10=>1000, 100=>100, 1000=>10, 10000=>1}) == 100
p nexus({1=>9999, 10=>999, 100=>99, 1000=>9, 10000=>0}) == 100
p nexus({5=>30, 10=>25, 15=>20, 20=>15, 25=>10, 30=>5}) == 15
p nexus({30=>5, 25=>10, 20=>15, 15=>20, 10=>25, 5=>30}) == 15 # check these 


