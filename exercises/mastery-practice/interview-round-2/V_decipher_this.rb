=begin
* DONE 27m16s
https://www.codewars.com/kata/581e014b55f2c52bb00000f8/train/ruby

You are given a secret message you need to decipher. Here are the things you need to know to decipher it:

For each word:

the second and the last letter is switched (e.g. Hello becomes Holle)
the first letter is replaced by its character code (e.g. H becomes 72)
Note: there are no special characters used, only letters and spaces

Examples

decipherThis('72olle 103doo 100ya'); // 'Hello good day'
decipherThis('82yade 115te 103o'); // 'Ready set go'

I: string 
O: string 

Rules:
  - second and last characters are swapped 
  - each word starts with a number 
    - number has an associated character on the ascii table 
  - no special characters, or puctuation
  - words are split by a space 


Examples:
                '72olle 103doo 100ya'
ord               72     103    100 
chr               H      g      d
remainder         _olle  _doo    _ya
                   ello   ood     ay
                   Hello good day

DS:
I: string 
Interm: arays 
O: string 

Algorithm:
- split the string by space--> `words_arr`

- init ords [] # [72, 103, 100]
- iterate over the words_arr
  - scan for numbers and store in ords (joined) and numeric 
  - make a transformation of the ords and store as clean_chars

- iterate again 
  - replace in my word 
    - search for match in the ords 

- iterate over words_arr --> transform 
  - for each word 
    - swap in the word, 
      - the second index, with the last


  - join back with a space 
=end 

def decipherThis(str)
  words_arr = str.split 

  ords_arr = []
  words_arr.each {|w| ords_arr << w.scan(/[\d]/).join}
 
  clean_chars = ords_arr.map{|item| item.to_i.chr}

  words_arr.map do |word|
    word.gsub!(ords_arr.shift, clean_chars.shift)
  end

  words_arr.map! do |word|
    word[1], word[-1] = word[-1], word[1]
    word
  end.join(' ')

end

p decipherThis('72olle 103doo 100ya') == 'Hello good day'
p decipherThis('82yade 115te 103o') ==  'Ready set go'
p decipherThis("65 119esi 111dl 111lw 108dvei 105n 97n 111ka") # handle the one letter problem