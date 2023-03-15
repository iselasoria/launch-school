=begin 
* DONE 19m15s
Write a function that returns true if all the strings in an array can be formed by using only the characters from the longest string.
Examples
can_form(["mast", "manifest", "met", "fan"]) ➞ true

can_form(["may", "master", "same", "reams"]) ➞ false

can_form(["may", "same", "reams", "mastery"]) ➞ true

Notes

There will only be one unique longest string.

I: array 
O: boolean

Rules:
- check if all the strings in the array can be made with the characters from the lognest string 
- implicit:
  - characters can be re-used 

  Examples:
  ["mast", "manifest", "met", "fan"]
  longest word: "manifest"
  * check if length of the intersection is equal to the size of the smaller word 

DS: 
I: array 
Interm: array 
O: boolean 

Algorithm:
- identify `longest_word` 
- get a tally of characters in longest word `longest_tally`

- itereate over the array 
  - for each word 
    - get a tally of word letters 
      - iterate over the tally in the word 
        - check that I have as many or more letters of a given kind in the longest_tally
          - true if I do, false otherwise 


=end 
def can_form(arr)
  longest_word = arr.max_by {|item| item.size}
  longest_tally = longest_word.chars.tally 



  arr.each do |word|
    w_tally = word.chars.tally 

    w_tally.each do |ltr, ct|
      return false if longest_tally[ltr].nil?

      if longest_tally[ltr] >= ct 
        next
      else
        return false 
      end
    end 
  end 
  true 
end


p can_form(["monument", "momento", "moment", "tome"]) == false

p can_form(["mast", "manifest", "met", "fan"]) == true
p can_form(["may", "master", "same", "reams"]) == false
p can_form(["may", "same", "reams", "mastery"]) == true
p can_form(["shape", "shapers", "raps", "saps"]) == true

p can_form(["kerfuffle", "fluke", "fluff", "ruffle" ]) == true