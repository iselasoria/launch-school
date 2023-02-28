=begin
Let's update our previous word-chain definition. In this 2.0 version, a word-chain is an array of words, where the next word is formed by either:

Changing exactly one letter from the previous word.
Adding or subtracting one letter.
Examples
is_word_chain(["row", "crow", "crown", "brown", "brawn"]) ➞ true
# add "c" to "row" to get "crow", "n" to get "crown", etc.

is_word_chain(["flew", "flaw", "flan", "flat", "fat", "rat", "rot", "tot"]) ➞ true

is_word_chain(["meek", "meet", "meat", "teal"]) ➞ false
# "meat" => "teal" changes 2 letters (can only change 1).

is_word_chain(["run", "runny", "bunny"]) ➞ false
# "run" => "runny" adds 2 letters (can only add 1).
Notes
You can only do one (not both) for each word change.
All words will be in lower-case.


I: array 
O: boolean

Rules:
- a chain must:
  - each next word must return true exclusively for:
    - only one character difference 
    - letters must have changed at only one spot

Examples / Model Solution:
                  ["meek", "meet", "meat", "teal"]
                  [meek, meet][meet, meat][meat, teal]
  size difference    4,4        4,4           4,4
                      0          0             0    
                    [m, m]      [m, m]    [t, l]
                    [e, e]      [e, e]    [e, e]
                    [e, e]      [e, a]    [a, a]
                    [k, t]      [t, t]    [t, l]
                  ["link", "blink", "wink", "sink"]
                  [link, blink][blink, wink][wink, sink]
                  [l,b]
                  [i,l]

Algorithm: 
Helper Method: valid_size_change(str1, str2) # no more than 1 increase/decrease
size difference between current and next must be no larger than 1 

Helper Method: valid_letter_change(str1, str2) # no more than 1 char changing 
- iterate through pares 
  - zip up chars in each of the pares 
    [m,m][e,e]...etc 
    - select those where the unique array is 2 --> these are diffs 
  - if diffs is larger than 1, return false 

Helper Method: xor?(b1, b2)
- if b1 is true and b2 is false, return true 
- or if b1 is false and b2 is true, return true

Main Method: is_word_chain(arr)
- init a boolean toggle to true and store as `chain`
- pair up words by 2s and store in `pares`

- iterate through pares array 
  - with each iteration:
    - if the current and next chars pass valid_size_change
      - check them for valid_letter_change
        - if valid, return true, otherwise return false 
    - if they do not,
      return false 
=end 
def valid_size_change(str1, str2)
  (str1.size - str2.size).abs == 1
end

# p valid_size_change("run", "runny")

def valid_letter_change(str1, str2)
  zipped_chars = str1.chars.zip(str2.chars)
  diffs = zipped_chars.select {|par_de_letras| par_de_letras.uniq.size > 1}.size
  diffs > 1 ? false : true
end

def propper_overlap(str1, str2)
  small = ''
  if str1.size < str2.size 
    small = str1 
  else
    small = str2
  end
  str1.chars.intersection(str2.chars).size >= small.size # must overlap at least one minus the size of the small
end
# puts "TEST"
# p visible_diffs("blink","wink")

def xor?(b1, b2)
  (b1 == true && b2 == false )|| (b1 == false && b2 == true)
end
# puts "XOR"
# p xor?(true, true)

def is_word_chain(arr)
  chain = true 
  pares = arr.each_cons(2).to_a

  pares.each do |par|
    # p par
    # puts "#{valid_size_change(par[0],par[1])} check size diff"
    # puts "#{valid_letter_change(par[0], par[1])} check letter changes"
  #  puts "#{xor?(valid_size_change(par[0],par[1]), valid_letter_change(par[0], par[1])) } is xor"
    # p par
    if valid_size_change(par[0],par[1]) == true # if they have different but valid size
      if propper_overlap(par[0], par[1]) == true 
        chain 
      else
        chain = !chain 
      end

      # here, valid_letter_change must be false 
      # if valid_letter_change()
      # puts  "#{par} has a valid size change"
      # check the changes 
      # if valid_letter_change(par[0], par[1]) == false 
      #   chain = !chain 
      # end
    elsif (par[0].size - par[1].size).abs > 1# they have different and invalid size 
      chain = !chain
    else # they have the same length
      # puts "#{par} has two words of the same legnth"
      # p "Now, let's check if the have a valid diff"
      if valid_letter_change(par[0], par[1]) == true
        chain
      else
        chain = !chain
      end
    end
  end
  chain
end

# # test cases
p is_word_chain(["row", "crow", "crown", "brown", "brawn"]) == true
p is_word_chain(["flew", "flaw", "flan", "flat", "fat", "rat", "rot", "tot"]) == true
p is_word_chain(["meek", "meet", "meat", "teal"]) == false
p is_word_chain(["fun", "fund", "find", "bind", "wind", "wild", "wile", "wiles"]) == true
p is_word_chain(["nut", "but", "bot", "boot", "loot", "look", "book", "brook"]) #== true
p is_word_chain(["some", "tome", "tame", "lame", "flame", "flamer", "blamer", "blamers"]) == true
p is_word_chain(["a", "at", "hat", "that", "what", "flat"]) == false
p is_word_chain(["run", "runny", "bunny"]) == false
p is_word_chain(["link", "blink", "wink", "sink"]) == false
# "nut", 
# "but"
# "bot"
# "boot"
# "loot"
# "look"
# "book"
# "brook"


################################

# def valid_size_change(str1, str2) # no more than a jump of 1 char at a time
#   (str1.size - str2.size).abs == 1
# end


# def valid_letter_change(str1, str2) # for words the same size, this checks if they only have one change
#   zipped_chars = str1.chars.zip(str2.chars)
#   diffs = zipped_chars.select {|par_de_letras| par_de_letras.uniq.size > 1}.size
#   diffs > 1 ? false : true
# end

# def propper_overlap(str1, str2) # the intersection of the words must be at least as big as the smaller word - 1 (accounting for diff)
#   small = ''
#   if str1.size < str2.size 
#     small = str1 
#   else
#     small = str2
#   end
#   str1.chars.intersection(str2.chars).size >= small.size
# end


# def is_word_chain(arr)
#   chain = true 
#   pares = arr.each_cons(2).to_a

#   pares.each do |par|
#     if valid_size_change(par[0],par[1]) == true # if they have different but valid size, we'll check for..
#       if propper_overlap(par[0], par[1]) == true  # if they have an overlap of all but 1 char acts as `xor?`
#         chain 
#       else
#         chain = !chain 
#       end
#     elsif (par[0].size - par[1].size).abs > 1# they have different and invalid size 
#       chain = !chain
#     else # they have the same length
#       if valid_letter_change(par[0], par[1]) == true #"Now, let's check if the have a valid diff"
#         chain
#       else
#         chain = !chain
#       end
#     end
#   end
#   chain
# end

# # # test cases
# p is_word_chain(["row", "crow", "crown", "brown", "brawn"]) == true
# p is_word_chain(["flew", "flaw", "flan", "flat", "fat", "rat", "rot", "tot"]) == true
# p is_word_chain(["meek", "meet", "meat", "teal"]) == false
# p is_word_chain(["fun", "fund", "find", "bind", "wind", "wild", "wile", "wiles"]) == true
# p is_word_chain(["nut", "but", "bot", "boot", "loot", "look", "book", "brook"]) #== true
# p is_word_chain(["some", "tome", "tame", "lame", "flame", "flamer", "blamer", "blamers"]) == true
# p is_word_chain(["a", "at", "hat", "that", "what", "flat"]) == false
# p is_word_chain(["run", "runny", "bunny"]) == false
# p is_word_chain(["link", "blink", "wink", "sink"]) == false

