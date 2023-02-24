=begin 
Your job is to write a function which increments a string, to create a new string.

If the string already ends with a number, the number should be incremented by 1.
If the string does not end with a number. the number 1 should be appended to the new string.
Examples:

foo -> foo1

foobar23 -> foobar24

foo0042 -> foo0043

foo9 -> foo10

foo099 -> foo100

Attention: If the number has leading zeros the amount of digits should be considered.

I: string 
O: string 

Rules:
- numbers always come at the end of the string 
- if the string has no number, it gets the next consecutive ---> 1 
- if it has a number, it gets the next consecutive ex) 23 --> 24 
- leading zeros:
  - 099 --> keep the same number of digits --> 100 
  - 0042 --> keep the same number of digits --> but keep consecutive --> 0043
- implicit: 
  - empty strings return a string containing the number 1 


Examples:
foo --> no number, gets 1 --> "foo1"
foobar001 --> retain digits amt --> increase consective --> foobar002 
foobar1 --> foobar2 
foobar00 --> foobar01 

Data Structures:
I: string
Interim: array 
O: string

Algorithm:
- if a range of strings 0-9 does not include all the characters in the string, then return string + 1

- split the string at the numbers and store as `arr_of_strings` # ["foobar","0","0","1"]

- initialzie `sig_figs` to hold significant figures # [1]
- initialize `leading_z` to hold leading zeros # [00]
- initialize `non_num` to hold letters only

- iterate over arr_of_strings # ["foobar","0","0","1"]
  - with each iteration --->"foobar".size 
  - if the item is non-numeric ex) length is greater than 1 --> capture in "non_num"

    - if the curent item is found in the range of 1-9 
      - add it to sig_figs string 
    - otherwise if its equal to 0
      - add to leading_z
  - incremenet sig_figs by 1 

  - concatenate nonnumeric string with leading zeros and incremented sig_figs #foobar + "00" + "2" ---> foobar002
=end 

def increment_string(str)
  if str.chars.all? {|item| !('0'..'9').to_a.include?(item) }
    return str + '1'
  end

  arr_of_strings = str.split(/(?=[0-9])/)

  sig_figs = ''
  leading_z = ''
  non_num = ''

  arr_of_strings.each do |item|
      if ('1'..'9').include?(item)
        sig_figs << item
      elsif item == '0'
        leading_z << item 
      else
        non_num << item
      end 
     
    end
    # puts "Sig figures: #{sig_figs}"
    # puts "Leading: #{leading_z}"

    if sig_figs.empty? 
      non_num + leading_z.chars.pop + "1"
    else
      non_num + leading_z + sig_figs.succ
    end
      # non numeric + leading zeros '00' minus length of the new succ sig figs -1 + sig_figs.succ 
                #  "foobar" "00" "1"
end

# test cases 
p increment_string("foo") == "foo1"
p increment_string("foobar001") =="foobar002"
p increment_string("foobar1") == "foobar2"
p increment_string("foobar99") == "foobar100"
p increment_string("") == "1"
p increment_string("foobar00") == "foobar01"


# p increment_string("foobar00101") 
# p increment_string("f00bar") --> "f00bar1" ---> "f0bar01" 
## find all potential significant figures in the number, those zeroes between two sig figs 


def increment_string(str)
  if str.chars.all? {|item| !('0'..'9').to_a.include?(item) } # checks when last char is not a num 
    return str + '1'
  end
    
  num = str.scan(/[\d]/).join.succ
  letters = str.chars.select{|item| ('a'..'z').include?(item)}.join
  letters + num
end 

# p increment_string("f00b4r") #== "f00b4r1"
p increment_string("f00bar") #== "f00bar1" # fbar01"

# TODO 
# Cruz's solution
def increament_str(str)
  num = str.scan(/[\d]/).join.succ
  letters = str.chars.select{|item| ('a'..'z').include?(item)}.join
  letters + num
end 