=begin 
Someone has attempted to censor my strings by replacing every vowel with a *, l*k* th*s. Luckily, I've been able to find the vowels that were removed.

Given a censored string and a string of the censored vowels, return the original uncensored string.

Example
uncensor("Wh*r* d*d my v*w*ls g*?", "eeioeo") ➞ "Where did my vowels go?"
uncensor("abcd", "") ➞ "abcd"
uncensor("*PP*RC*S*", "UEAE") ➞ "UPPERCASE"

Notes
    The vowels are given in the correct order.
    The number of vowels will match the number of * characters in the censored string.

I: two string object, first is the message and second is the vowels that have been censored
O: string 

Rules:
- vowels in the message were replaced by asterisk (*)
- censored vowels have been given in order.
  - ex) the first vowel in the vowels_str replaces the first asterisk, the second one replaces the second, etc 
- uppercase and lowercasr strings in both input objects 

Examples:
inputs: uncensor("Wh*r* d*d my v*w*ls g*?", "eeioeo") 
indexes:                                     012345
                  Wh0r1 d2d my v3w4ls g5?
                  Where did my vowels go?

inputs: uncensor("abcd", "")
                        no vowels were removed, so return original message 


inputs:  uncensor("*PP*RC*S*", "UEAE")
indexes:                        0123
                  0PP1RC2S3
                  UPPERCASE

inputs: uncensor('Ch**s*, Gr*mm*t -- ch**s*', 'eeeoieee')
indexes:                                       01234567
                  Ch01s2, Gr3mm4t -- ch56s7
                  Cheese, Grommit -- cheese


inputs: ('*l*ph*nt', 'Eea')
                      012
          Elephant 

Data Structures:
I: stirng 
Interim: arrays --> I want the index 
O: string 

Algorithm:
- generate a vowels_hash to hold position as key and vowel as value # {'0' => "e", '1'=>"e",'2'=>"i",'3'=> "o"....}

- tag message with ascending values to asterisk from 0 to last index of second argument  # 'Wh0r1 d2d my v3w4ls g5?'
- initialize an `indexed_str`
  - iterate over the message string
    - when I find an astesrisk
      - IF indexed_str does NOT contain asterisk yet
        - `counter_up` that starts at 0
        - push counter_up into indexed_str # still at zero 
      - if its not the first one, 
        - push counter_up.succ 
    - otherwise 
    ## result expected: # 'Wh0r1 d2d my v3w4ls g5?'

- iterate over indexed_str 
  - if current character is found in the vowels_hash, then replace it in this string 


=end 

def gen_hash(str)
  new_hash = {}
  str.chars.each_with_index do |ch, idx|
    new_hash[idx.to_s] = ch
  end
  new_hash
end 


def uncensor(message, vowels)
  vowels_hash = gen_hash(vowels)

  indexed_str = ''

  counter_up = '0'

  message.chars.each do |ch|
    if ch == '*' 
      if !indexed_str.chars.include?('0') # if it's the first * 
        # counter_up
        indexed_str << counter_up
      elsif indexed_str.chars.include?('0') # not the first *
        counter_up = counter_up.succ
        indexed_str << counter_up
      end
    else # just letters 
      indexed_str << ch
    end
  end

  results = ''

  indexed_str.chars.each do |ch|
    if vowels_hash.keys.include?(ch)
      results << vowels_hash[ch]
    else
      results << ch 
    end
  end
  results
end

p uncensor('Wh*r* d*d my v*w*ls g*?', 'eeioeo') == 'Where did my vowels go?'
p uncensor('abcd', '') == 'abcd'
p uncensor('*PP*RC*S*', 'UEAE') == 'UPPERCASE'
p uncensor('Ch**s*, Gr*mm*t -- ch**s*', 'eeeoieee') == 'Cheese, Grommit -- cheese'
p uncensor('*l*ph*nt', 'Eea') == 'Elephant'

