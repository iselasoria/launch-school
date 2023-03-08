# * DONE 21m36s
# You are given a string of words (x), for each word within the string you need to turn the word 'inside out'. By this I mean the internal letters will move out, and the external letters move toward the centre.

# If the word is even length, all letters will move. If the length is odd, you are expected to leave the 'middle' letter of the word where it is.

# An example should clarify:

# 'taxi' would become 'atix' 'taxis' would become 'atxsi'
=begin 
I: string 
O: string 

Rules:
- internal letter will move out
- external letters move to the center 
- even legnth words:
  - all letters mvoe 
- odd length words:
  - middle character stays in place 
Implict Rule:
  - change only happesn for words that are 4 characters or more 

Examples:
"taxi"
even number of letters
"atix"

"taxis"
odd number of characters 
middle: x 
__x__
atxsi

'massage'--> odd number of chars 
    s
 samsega

DS: 
I: string
Intermdiate: arrays 
O: string 

Algorithm:
- split the string into words --> `words_arr`
- iterate over words_arr--> transformed 
  - for each word:                            "taxi"
    - return word as is if word size is less than 4 
    - if word size is even?
      - split the word from 0 up to word size / 2 and store in `fh` # "ta"
        - reverse the half # "at"
      - split the word from half + 1 to the end, store in `sh`
        - reverse the half "ix"
      - join two halves 
    - otherwise if it's odd 
      -get middle character as word at word size/2
      - get fh --> reverse
      - get sh  --> reverse 
      - concatenate fh + middle + sh 
  - join all transformed words with a space 
=end 

def inside_out(str)
  words_arr = str.split

  words_arr.map do |word|
    if word.size < 4
      word 
    else
      # transformation happens here 
      if word.size.even?
        fh = word[0...word.size/2].reverse
        sh = word[word.size/2..-1].reverse
        word = fh + sh
        word 
      elsif word.size.odd?
        middle_char = word[word.size/2]
        fh = word[0...word.size/2].reverse
        sh = word[word.size/2 + 1..-1].reverse
        word = fh + middle_char + sh 
        word
      end 
    end
  end.join(' ')
end 

p inside_out('man i need a taxi up to ubud') == 'man i ende a atix up to budu'
p inside_out('what time are we climbing up the volcano') == 'hwta item are we milcgnib up the lovcona'
p inside_out('take me to semynak') == 'atek me to mesykan'
p inside_out('massage yes massage yes massage') == 'samsega yes samsega yes samsega'
p inside_out('take bintang and a dance please') == 'atek nibtgna and a adnec elpesa'
