=begin 
You are given an array of strings words and a string chars.

A string is good if it can be formed by characters from chars (each character can only be used once).

Return the sum of lengths of all good strings in words.


Input: words = ["cat","bt","hat","tree"], chars = "atach"
Output: 6
Explanation: The strings that can be formed are "cat" and "hat" so the answer is 3 + 3 = 6.

Input: words = ["hello","world","leetcode"], chars = "welldonehoneyr"
Output: 10
Explanation: The strings that can be formed are "hello" and "world" so the answer is 5 + 5 = 10.

I: array of strings 
O: integer 

Rules:
- arr contains words that we want to check for validity 
- str contains characters out of which we can form the valid words 
- characters can only be used once per word 
- gather up all the valid words and return their total string size 


Examples:
words = ["cat","bt","hat","tree"]
chars = "atach" 

valid strings: 'cat' and 'hat'

words = ["hello","world","leetcode"]
chars = "welldonehoneyr"
* find every single character in the word in the chars pool if all are found, a string is valid

Data Structures:
I: array 
Interim: array 
O: integer 

Algorithm:

- iterate over the array --> selection 
  - for each word 
    - check that all of its characters are included in the chars_pool 
- get and return size of all valid words 

https://leetcode.com/problems/find-words-that-can-be-formed-by-characters/description/
=end 

def count_characters(words, chars_pool)
  words.select do |word| 
    word.chars.all? do |letter| 
      word.count(letter) <= chars_pool.count(letter)
      # chars_pool.chars.include?(letter)
    end 
  end.map(&:size).sum
end

words = ["cat","bt","hat","tree"]
chars = "atach"
p count_characters(words, chars) #== 6

words = ["hello","world","leetcode"]
chars = "welldonehoneyr"
p count_characters(words, chars) #== 10

# words = ["dyiclysmffuhibgfvapygkorkqllqlvokosagyelotobicwcmebnpznjbirzrzsrtzjxhsfpiwyfhzyonmuabtlwin","ndqeyhhcquplmznwslewjzuyfgklssvkqxmqjpwhrshycmvrb","ulrrbpspyudncdlbkxkrqpivfftrggemkpyjl","boygirdlggnh","xmqohbyqwagkjzpyawsydmdaattthmuvjbzwpyopyafphx","nulvimegcsiwvhwuiyednoxpugfeimnnyeoczuzxgxbqjvegcxeqnjbwnbvowastqhojepisusvsidhqmszbrnynkyop","hiefuovybkpgzygprmndrkyspoiyapdwkxebgsmodhzpx","juldqdzeskpffaoqcyyxiqqowsalqumddcufhouhrskozhlmobiwzxnhdkidr","lnnvsdcrvzfmrvurucrzlfyigcycffpiuoo","oxgaskztzroxuntiwlfyufddl","tfspedteabxatkaypitjfkhkkigdwdkctqbczcugripkgcyfezpuklfqfcsccboarbfbjfrkxp","qnagrpfzlyrouolqquytwnwnsqnmuzphne","eeilfdaookieawrrbvtnqfzcricvhpiv","sisvsjzyrbdsjcwwygdnxcjhzhsxhpceqz","yhouqhjevqxtecomahbwoptzlkyvjexhzcbccusbjjdgcfzlkoqwiwue","hwxxighzvceaplsycajkhynkhzkwkouszwaiuzqcleyflqrxgjsvlegvupzqijbornbfwpefhxekgpuvgiyeudhncv","cpwcjwgbcquirnsazumgjjcltitmeyfaudbnbqhflvecjsupjmgwfbjo","teyygdmmyadppuopvqdodaczob","qaeowuwqsqffvibrtxnjnzvzuuonrkwpysyxvkijemmpdmtnqxwekbpfzs","qqxpxpmemkldghbmbyxpkwgkaykaerhmwwjonrhcsubchs"]
# chars = "usdruypficfbpfbivlrhutcgvyjenlxzeovdyjtgvvfdjzcmikjraspdfp"

# p count_characters(words, chars)

