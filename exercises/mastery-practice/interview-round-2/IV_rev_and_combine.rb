=begin 
Your task is to Reverse and Combine Words. It's not too difficult, but there are some things you have to consider...

So what to do?
Input: String containing different "words" separated by spaces

1. More than one word? Reverse each word and combine first with second, third with fourth and so on...
   (odd number of words => last one stays alone, but has to be reversed too)
2. Start it again until there's only one word without spaces
3. Return your result...

EX]
Input:  "abc def"
Output: "cbafed"

Input:  "abc def ghi 123"
Output: "defabc123ghi"

Input:  "abc def gh34 434ff 55_eri 123 343"
Output: "43hgff434cbafed343ire_55321"

I: string 
O: string 


Rules:
- words are spearated by space 
- more than one word strings:
  - reverse each word 
  - combine first with second, third with fouth and so on 
  - if the number of words is odd, the last word does not get combined at all but has to be reversed too 

- start process again until there is only one word with no spaces 

Examples:
input:      "abc def ghi jkl"
words:        1   2   3    4
reversed:     cab fed ihg lkj 
pairs:        [1,2]   [3,4]
combined:      cabfed ihglkj
words:             1      2
reversed again: defbac jklghi 
pairs:              [1,2]
combined again: defbacjklghi 
  
DS:
I: strings 
Interim: arrays
O: string 


Algorithm:
- slit string into words and store in `words_arr`

while words array contains more than one item, do the following:
  - transform the array to reverse all the words 
    - make consecutive pairs 
    - join pairs and let this be the new words_arr

return first element of words_arr
=end 

def reverse_and_combine_text(str)
  words_arr = str.split

  while words_arr.size != 1
    words_arr = words_arr.map(&:reverse).each_slice(2).to_a.map(&:join) 
  end
  words_arr.first
end

# test cases 
p reverse_and_combine_text("abc def") == "cbafed"
p reverse_and_combine_text("abc def ghi jkl") == "defabcjklghi"
p reverse_and_combine_text("dfghrtcbafed") == "dfghrtcbafed"
p reverse_and_combine_text("234hh54 53455 sdfqwzrt rtteetrt hjhjh lllll12  44") == "trzwqfdstrteettr45hh4325543544hjhjh21lllll"
p reverse_and_combine_text("sdfsdf wee sdffg 342234 ftt") == "gffds432243fdsfdseewttf"
