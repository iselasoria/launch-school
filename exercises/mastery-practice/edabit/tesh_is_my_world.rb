=begin 
* DONE 09m04s
Write a function that takes a string input and returns the string in a reversed case and order.
Examples

invert("dLROW YM sI HsEt") ➞ "TeSh iS my worlD"

invert("ytInIUgAsnOc") ➞ "CoNSaGuiNiTY"

invert("step on NO PETS") ➞ "step on NO PETS"

invert("XeLPMoC YTiReTXeD") ➞ "dExtErIty cOmplEx"

Notes
  No empty strings and will neither contain special characters nor punctuation.

I: array of strings
O: array fo strings 

Rules:
- reverse each item in the array 
- swap the case of the chars in the string 

Examples:
"dLROW YM sI HsEt"
"TeSh iS my worlD",

DS: 
- arrays 

Algorithm:

- reverse the order of the chunks in the array Array

- iterate over the reversed aray --> transformed 
  - itearte over each word 
    - swap the case 

=end

def invert(arr)
  arr.map! {|chunk| chunk.reverse}
  
  arr.map do |phrase|
    phrase.chars.map! {|ch| ch.swapcase}.join
  end
end

str_vector, res_vector = [
  "dLROW YM sI HsEt", "This string is CASE and INDEX reversed", "ReVeRsIbLe", "rAmIfIcAtIoN", "IntellectualS",
  "DESREVER xedni DNA esac SI GNIRTS SIHt", "ElBiSrEvEr", "nOiTaCiFiMaR", "sLAUTCELLETNi",
  "CoNSaGuiNiTY", "step on NO PETS", "dExtErIty cOmplEx"
], [
  "TeSh iS my worlD", "DESREVER xedni DNA esac SI GNIRTS SIHt", "ElBiSrEvEr", "nOiTaCiFiMaR", "sLAUTCELLETNi",
  "This string is CASE and INDEX reversed", "ReVeRsIbLe", "rAmIfIcAtIoN", "IntellectualS",
  "ytInIUgAsnOc", "step on NO PETS", "XeLPMoC YTiReTXeD"
]

p invert(str_vector) == res_vector
# p str_vector
# p res_vector