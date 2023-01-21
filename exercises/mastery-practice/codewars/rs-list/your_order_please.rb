=begin 
* DONE 20m 
Your task is to sort a given string. Each word in the string will contain a single number. This number is the position the word should have in the result.

Note: Numbers can be from 1 to 9. So 1 will be the first word (not 0).

If the input string is empty, return an empty string. The words in the input String will only contain valid consecutive numbers.


I: string 
O: string 

Rules:
  - numbers contained in the string are the word's position in the result string 
  - numbers will range from 1-9
  - empty input return empty output


Examples:
"is2 Thi1s T4est 3a"  -->  "Thi1s is2 3a T4est"
  2     1   4     3
  1     2   3     4
 Thi1s is2 3a T4est

"4of Fo1r pe6ople g3ood th5e the2"  -->  "Fo1r the2 g3ood 4of th5e pe6ople"
 4    1     6     3       5   2
 1    2     3     4       5    6
 Fo1r the2 g3ood 4of    th5e  pe6ople 


""  -->  ""

Data Structures: 
I: string 
Interim: array , hash 
O: string 

Algorithm: 
- if empty return empty string 
- split into words 
- iterate over the words array 
- for each iteration #---> each_with_object hash[poisiton] = word 
  - extract the number from the word 
  - set position as number and value as word 
- sort new has by the key ie) position, access its values (array of words), join and return

=end 


def order(str)
  words = str.split

  new_hash = {}

  words.each do |word|
    new_hash[word.scan(/[0123456789]/)[0].to_i] = word
  end

  new_hash.sort_by {|pos, word| pos}.to_h.values.join(' ')
end

# Chris and Cruz's answers

# def order(string) 
#   splt_str = string.split(" ")
#   return_array = (0..splt_str.length - 1).to_a

#   splt_str.each do |word|
#     word.each_char do |letter|
#       if letter.to_i.to_s == letter
#         return_array[letter.to_i - 1] = word
#       end
#     end
#   end 
#   return_array.join(' ')
# end 

# def order(string)
#   (1..string.split.size).each_with_object([]) do |num, sorted_words|
#     string.split.each { |word| sorted_words << word if word.include?(num.to_s) }
#   end.join(' ')
# end 

# test cases 
p order("is2 Thi1s T4est 3a") == "Thi1s is2 3a T4est"
p order("4of Fo1r pe6ople g3ood th5e the2") == "Fo1r the2 g3ood 4of th5e pe6ople"
p order("") == ""