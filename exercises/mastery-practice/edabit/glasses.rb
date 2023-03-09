=begin 
Oh no! I've lost my glasses, but paradoxically, I need glasses to find my glasses!

Please help me out by showing me the index in the list which contains my glasses. They look like two capital Os, with any number of dashes in between!

    This means that both O--O and O------------O are valid glasses, but not O----#--O for example!
    Search thoroughly, maybe you'll find my glasses in places such as 'dustO-Odust'

Examples

find_glasses(["phone", "O-O", "coins", "keys"]) ➞ 1
find_glasses(["OO", "wallet", "O##O", "O----O"]) ➞ 3
find_glasses(["O--#--O", "dustO---Odust", "more dust"]) ➞ 1

Notes
  All lists will include one valid pair of glasses because I swear I dropped them around here somewhere ...
  All elements in the list are strings.

I: array 
O: integer 

Rules:
- return the index of the word that contains glasses 
- glasses can be O and O with variable number of (-) between 

Examples:

input:                    ['phone', 'O-O', 'coins', 'keys']
rule out:                                              X 
if only 1 O, then ignore      X               X 

['OOOO----~OOO', '-------', 'OOOOOOO', 'OO-OO-OO-O']
                     X 

DS: 
strings 
arrays 


Notes:
  - scan the string for standad glasses 

Algorithm:
- standardize glasses as 'O-O' by squeezing the dashes 

- iterate over the array of places and its index 
  - at every place, 
    - search for glasses 
      - squeeze the dash out of the string 
        - scan the squeezed string for standard glasses and store in `already_checked`
        - if checker_here is no empty return the index 
=end 
def find_glasses(places)
  standard = "O-O"

  places.each_with_index do |pl, idx|
    already_checked = pl.squeeze('-').scan(standard)
    return idx if !already_checked.empty?
  end
end 

p find_glasses(['phone', 'O-O', 'coins', 'keys']) == 1
p find_glasses(['OO', 'wallet', 'O##O', 'O----O']) == 3
p find_glasses(['O_O', 'O-O', 'OwO']) == 1
p find_glasses(['O--#--O', 'dustO---Odust', 'more dust']) == 1
p find_glasses(['floor', 'the floor again', 'pockets', 'bed', 'cabinet', 'the top of my head O-O']) == 5
p find_glasses(['OOOO----~OOO', '-------', 'OOOOOOO', 'OO-OO-OO-O']) == 3