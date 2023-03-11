=begin 
* DONE 18m04s
Create a function that takes an array of any length. Modify each element (capitalize, reverse, hyphenate).

Examples
editWords(["new york city"]) ➞ ["YTIC KR-OY WEN"]
editWords(["null", "undefined"]) ➞ ["LL-UN", "DENIF-EDNU"]
editWords(["hello", "", "world"]) ➞ ["OLL-EH", "-", "DLR-OW"]
editWords([""]) ➞ ["-"]

Notes

Input array values can be any type.

I: string 
O: Array

Rules:
- capitalize 
- reverse --> on array,and  on the word 
- hyphenate -> every element 
  - if str size is odd, places the hyphen on the second end of the string "hello"--> "he-llo" so that after
     hyphenation, string size is even on all 
  - if even, slides a hyphen in between the halves "null" --> "nu-ll"

Examples:
editWords(["new york city"]) ➞ ["YTIC KR-OY WEN"]
editWords(["null", "undefined"]) ➞ ["LL-UN", "DENIF-EDNU"]
editWords(["hello", "", "world"]) ➞ ["OLL-EH", "-", "DLR-OW"]
editWords([""]) ➞ ["-"]


Examples:
["null", "undefined"] == ["LL-UN", "DENIF-EDNU"] 
 NULL     UNDEFINED 
 LLUN     DENIFEDNU
  4           9 
 LL-UN    DENIF-EDNU ---> return 


 DS:
 array 
 strings 

 Algorithm:
 - iterate over the array --> transform 
  - with each word, capitalize and reverse [LLUN, DENIFEDNU]
- itearate over the transformed array 
  - init and define fh and sh and middle 
  - if size is odd 
    - prepend at hyphen to the second half
  - else 
    - insert a hyphen between fh and sh join

=end 
def editWords(arr)
  arr.map! {|word| word.upcase.reverse}

  arr.map do |word|
    middle = word.size / 2
    if word.size.odd?
      fh = word[0..middle]
      sh = word[middle+1..-1]
      fh + '-' + sh
    else
     fh = word[0...middle]
     sh = word[middle..-1]
     fh + '-' + sh
    end 
  end
end

p editWords(["javascript"]) == ["TPIRC-SAVAJ"]
p editWords(["hello", "", "world"]) == ["OLL-EH", "-", "DLR-OW"]
p editWords(["null", "undefined"]) == ["LL-UN", "DENIF-EDNU"]
p editWords(["wood", "", "block"]) == ["DO-OW", "-", "KCO-LB"]
p editWords(["new york city"]) == ["YTIC KR-OY WEN"]
p editWords(["html", "css"]) == ["LM-TH", "SS-C"]
p editWords(["react", "vue", "angular"]) == ["TCA-ER", "EU-V", "RALU-GNA"]
p editWords(["11111", "999", "3333"]) == ["111-11", "99-9", "33-33"]
p editWords([""]) == ["-"]