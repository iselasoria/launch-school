=begin 
* DONE 21m---> 50m
Implement a pseudo-encryption algorithm which given a string S and an integer N concatenates all the odd-indexed characters of S with all the even-indexed characters of S, this process should be repeated N times.


encrypt("012345", 1)  =>  "135024"
encrypt("012345", 2)  =>  "135024"  ->  "304152"
encrypt("012345", 3)  =>  "135024"  ->  "304152"  ->  "012345"

encrypt("01234", 1)  =>  "13024"
encrypt("01234", 2)  =>  "13024"  ->  "32104"
encrypt("01234", 3)  =>  "13024"  ->  "32104"  ->  "20314"

Together with the encryption function, you should also implement a decryption function which reverses the process.

If the string S is an empty value or the integer N is not positive, return the first argument without changes.

PROBLEM:
I: string, and an iteger 
O: string 

Rules:
- Concatenate odd indexed characters with odd-indexed characters
- `N` is the number of times the process is to be repeated
- if string is empty, or n is negative return first argument without change 
- in concatenation, the off indexed characters come first 

Examples / Model Solution: 

input: "012345" and 1 
index:  012345
odd_idx =  [1,3,5] \____>  "135024"
even_idx = [0,2,4] /


input:     "012345" and 2  =>  "135024"  ->  "304152"
index:      012345
even_idx = [1,2,4]\_____> "135024"
odd_idx =  [1,3,5]/

input:     "135024"
index:      012345
even_idx: [1,5,2] \____> "304152"
odd_idx:  [3,0,4] /

Data Structures:
I: string 
Interim: array 
O: string 

Algorithm:
if input string is empty, or n is negative or zero, return string 
- loop through n-times 
  - itinialize `odd_chunk` and `even_chunk`
  - iterate over the characters in the string and their index 
    - push into odd_chunk those values where the index is odd 
    - push into even_chunk those values where the index is even 
  - reassign str to odd_chunk concatenated with even_chunk


decrypt:
loop through n times 
  - iterate over the string 
    - from 0 to the middle of the string--> odd_idx 
    - from the middle + 1 to the end --> even_idx 
    - middle - 1 for odd lengths 
    "hsi  etTi sats!"
    odd_chunk = hsi  et
    even_chunk = Ti sats!
    string = This
     012345678910111213
    new_str = 'This i  et'
               012345

=end 

def encrypt(str, reps)
  return str if str.empty? || reps < 1

  reps.times do |_|
  odd_chunk = []
  even_chunk = []

  str.chars.each_with_index do |ch, idx|
    if idx.odd?
      odd_chunk << ch
    else 
      even_chunk << ch 
    end
  end
  str = odd_chunk.join.concat(even_chunk.join)
  end
  str
end


def decrypt(str, reps)
  return str if str.empty? || reps < 1

  reps.times do |_|

    odd_chunk = str[0...str.size / 2].chars
    even_chunk = str[str.size / 2..-1].chars

    str = even_chunk.zip(odd_chunk).join
  end
  str
end



# test cases 

p encrypt("This is a test!", 0) == "This is a test!"
p encrypt("This is a test!", -1) == "This is a test!"
p encrypt("", 0) == ""
p encrypt("This is a test!", 1) == "hsi  etTi sats!"
p encrypt("This is a test!", 2) == "s eT ashi tist!"
p encrypt("This is a test!", 3) == " Tah itse sits!"
p encrypt("This is a test!", 4) == "This is a test!"
p encrypt("This kata is very interesting!", 1) == "hskt svr neetn!Ti aai eyitrsig"
p decrypt("This is a test!", 0) == "This is a test!"
p decrypt("hsi  etTi sats!", 1) == "This is a test!"
p decrypt("", 0) == ""


p decrypt("s eT ashi tist!", 2) == "This is a test!"
p decrypt(" Tah itse sits!", 3) == "This is a test!"
p decrypt("This is a test!", 4) == "This is a test!"
p decrypt("This is a test!", -1) == "This is a test!"

p decrypt("hskt svr neetn!Ti aai eyitrsig", 1) == "This kata is very interesting!"



