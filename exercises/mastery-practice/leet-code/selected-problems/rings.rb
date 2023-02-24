=begin 
* DONE 25m49
There are n rings and each ring is either red, green, or blue. The rings are distributed across ten rods labeled from 0 to 9.

You are given a string rings of length 2n that describes the n rings that are placed onto the rods. Every two characters in rings forms a color-position pair that is used to describe each ring where:

    The first character of the ith pair denotes the ith ring's color ('R', 'G', 'B').
    The second character of the ith pair denotes the rod that the ith ring is placed on ('0' to '9').

For example, "R3G2B1" describes n == 3 rings: a red ring placed onto the rod labeled 3, a green ring placed onto the rod labeled 2, and a blue ring placed onto the rod labeled 1.

Return the number of rods that have all three colors of rings on them.

I: string 
O: integer 

Rules:
- in the string, two characters give the ring position and color 
  - RGB and 0-9
- string can containg a varying number of position "pairs"
- rings can be all in one rod or distributed 

Goal: determine how many rods have all three colors 

Examples:
input: 'G4'
* only one ring, no possible rods can have all three colors 

input: 'B0B6G0R6R0R6G9'
        B0 R0 G0 R9 R0 B0 G0
        0 -> B R G R B G 
        9 -> R 
        

input: 'B0R0G0R9R0B0G0'
        B0 R0 G0 R9 R0 B0 G0
        0 -> R G B 

Data Structures:
I: string 
Interim: arrays 
O: integer 

Algorithm:
- get consecutive pairs of letter + number # [['B0'],['R0']...] `positions`

* group by the color 
- initi pos_hash 
  - iterate over the array of `positions`
    - for each iteartion 
      - set in pos_hash 
        - if pos_hash already has the key 
          - push key as the rod, second item in the pair 
        - if this is the first time 
          - set color as value, first item in the pair in an array form 

- pos_hash --> # {0 => [B R G R B G ], 1 => [R]}
- select from the pos_hash all those that have a uniq value three elements long 
  
=end 

def count_points(str)
  positions = str.chars.each_cons(2).to_a.select.with_index {|pair, idx| idx.even?}

  pos_hash = {}

  positions.each do |pair|
    if pos_hash.has_key?(pair[1])
      pos_hash[pair[1]] << pair[0]
    else
      pos_hash[pair[1]] = [pair[0]]
    end
  end
  pos_hash.select do |rod, rings|
    rings.uniq.size == 3
  end.size
end


def count_points(rings)
  pairs = rings.chars.chunk_while {|a, b| a > b }.to_a

  groups = pairs.group_by {|pair| pair[1]}
  new_hash = {}
  groups.each do |num, colors|
    chain = []
    colors.each do |item|
      chain << item[0]
    end
    new_hash[num] = chain
  end
  new_hash.select {|key, val| val.uniq.size == 3}.size
end

def count_points(rings)
  rods = {}
  ('0'..'9').each { |rod| rods[rod] = [] }
  
  chars = rings.chars 
  chars.each_with_index do |char, idx|
    if idx.odd?
      rods[char] << chars[idx-1]
    end
  end 

  rods.count { |rod, arr| arr.uniq.size == 3 }
end 

p count_points("B0B6G0R6R0R6G9") == 1
p count_points("B0R0G0R9R0B0G0") == 1
p count_points("G4") == 0

# https://leetcode.com/problems/rings-and-rods/description/