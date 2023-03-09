=begin 
# TODO this aint working!
Create a function that takes a string txt and expands it as per the following rules:
    The numeric values represent the occurrence of each letter preceding that numeric value.

string_expansion("3M2u5b2a1s1h2i1r") ➞ "MMMuubbbbbaashiir"

    The first occurrence of a numeric value should be the number of times each character behind it is repeated, until the next numeric value appears.

string_expansion("3Mat")➞ "MMMaaattt"      # correct
string_expansion("3Mat") ➞ "MMMat"          # wrong
string_expansion("3Mat") ➞ "MatMatMat"      # wrong

    If there are consecutive numeric characters, ignore them all except last one.

string_expansion("3M123u42b12a") ➞ "MMMuuubbaa"
  If there are two consecutive alphabetic characters then the string will remain unchanged.

string_expansion("airforce") ➞ "airforce"
    Empty strings should return an empty string.

string_expansion("") ➞ ""

Notes

N/A

I: string 
O:string 

Rules:
- characters in group are each repeated n number of times 
  - n is the number directly before a group/character 
  - all other numbers get ignored
- case matters 

Examples:
"3Mat"
 3(M a t) --> MMMaaattt

"3M2u5b2a1s1h2i1r"
 3(M)2(u)5(b)2(a)1(s)1(h)2(i)1(r)
 MMMuubbbbbaashiir

 DS:
 String
 array (maybe index)

Algorithm:
 - make a duplicate of the input string `str_dupe`

- in the dupe, replace the numbers with spaces
- split the newly altered dupe by space and store in `groups`

- exapnded_str = ''
- iterate over the input string # 3Mat4R
  - when I find a number # 3
    - distribute it to the characters in the first element from the groups array (shift elements)
       - iterate over chars and multiply the num by each item -> M a t t -> MMMaaattt store exapnded_str
- exapnded_str
=end 

def pick_me(arr, og_str) # groups, og_str
  # select only those that come after a number
  # their search index is the successor of one that has a number 
  puts "My groups: #{arr}"
  puts "My og string: #{og_str}"
  puts "-------------------"
  number_idx = og_str.chars.map.with_index do |ch, idx|
    if ch  == ch.to_i.to_s
      idx 
    end
  end.compact!

  puts "I found a number at index: #{number_idx}"
  puts "Now I want to check if the index where the group starts is a successor of the number index "

  puts "-------------------"
  my_prev = []
  arr.each_with_index do |item, idx|
    search_idx = og_str.index(item) # the start index of the chunk in the og_str
    puts "Group starts at: #{search_idx}"
    p item
    # the index of the number 
    if !number_idx[idx].nil?
      index_where_i_found_num = number_idx[idx]
      puts  "Found a number at this index: #{index_where_i_found_num}"
      puts "Is search a successor: #{index_where_i_found_num == search_idx.succ}"
      puts "Is num index a successor: #{search_idx.succ == index_where_i_found_num}"
      next if index_where_i_found_num != search_idx.succ
      if index_where_i_found_num == search_idx.succ
        my_prev << search_idx
      end
    end
    # check if the search_idx is the successor 
    # p search_idx == index_where_i_found_num.succ # successor of num str
  end
  my_prev
end

p pick_me(["A", "g", "b", "d"], "A4g1b4d")

# def string_expansion(str)
#   string_dupe = str.dup 

#   string_dupe.gsub!(/[0-9]/, " ")
#   groups = string_dupe.split

#   # select groups that follow a number in the original string 
#   # retrieve the index of the group that matches the original string #str.index("ean")
#     # if originals tring at previous index was a number, select it 

#   expanded_str = ''
#   p groups
#   str.chars.each do |ch|
#     if ch == ch.to_i.to_s # when I find a number 
#       p ch 
#       p groups.first
#       expanded_str << groups.shift.chars.map{|letter| letter * ch.to_i}.join # distribute to the group
#     else 
#       expanded_str << ch
#     end

#   end
#   expanded_str
# end

# p string_expansion("3M2u5b2a1s1h2i1r") =="MMMuubbbbbaashiir"
# p string_expansion("3Mat") == "MMMaaattt"
# p string_expansion("3Mat4R") == "MMMaaatttRRRR"
# p string_expansion("3n6s7f3n") == "nnnssssssfffffffnnn"
# p string_expansion("0d4n8d2b") == "nnnnddddddddbb"
# p string_expansion("0c3b1n7m") == "bbbnmmmmmmm"
# p string_expansion("7m3j4ik2a") == "mmmmmmmjjjiiiikkkkaa"
# p string_expansion("3A5m3B3Y") == "AAAmmmmmBBBYYY"
# p string_expansion("2B") == "BB"
# p string_expansion("7M1n3K") == "MMMMMMMnKKK"

# p string_expansion("A4g1b4d") #== "Aggggbdddd"

# p string_expansion("5M0L8P1") == "MMMMMPPPPPPPP"
# p string_expansion("111111") == ""
# p string_expansion("4d324n2") == "ddddnnnn"
# p string_expansion("5919nf3u") == "nnnnnnnnnfffffffffuuu"
# p string_expansion("3M123u42b12a") == "MMMuuubbaa"