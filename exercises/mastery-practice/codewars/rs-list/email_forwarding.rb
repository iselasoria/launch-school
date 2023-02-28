=begin 
# Every valid email consists of a local name and a domain name, separated by the '@' sign. Besides lowercase letters, the email may contain one or more '.' or '+'.

# For example, in "alice@leetcode.com", "alice" is the local name, and "leetcode.com" is the domain name.
# If you add periods '.' between some characters in the local name part of an email address, mail sent there will be forwarded to the same address without dots in the local name. Note that this rule does not apply to domain names.

# For example, "alice.z@leetcode.com" and "alicez@leetcode.com" forward to the same email address.
# If you add a plus '+' in the local name, everything after the first plus sign will be ignored. This allows certain emails to be filtered. Note that this rule does not apply to domain names.

# For example, "m.y+name@email.com" will be forwarded to "my@email.com".
# It is possible to use both of these rules at the same time.

# Given an array of strings emails where we send one email to each emails[i], return the number of different addresses that actually receive mails.

 

# Example 1:
# Input: emails = ["test.email+alex@leetcode.com","test.e.mail+bob.cathy@leetcode.com","testemail+david@lee.tcode.com"]
# Output: 2
# Explanation: "testemail@leetcode.com" and "testemail@lee.tcode.com" actually receive mails.

# Example 2:
# Input: emails = ["a@leetcode.com","b@leetcode.com","c@leetcode.com"]
# Output: 3

I: array of strings 
O: integer 

Goal: to identify the number of email addresses that actually get emails 

Rules:
- email must have @ sign 
  - local name + @ + domain name 
- if local name has a `+`, any trailing characters get ignored --> + in domain name makes email invalid 
- if local name has '.' then emails will forward to the address without them
- both rules can be used at the same time 

Examples / Model Solution:
["test.email+alex@leetcode.com","test.email.leet+alex@code.com"]
["testemail@leetcode.com","testemail.leet@code.com"] --> 2 unique email addresses 

["a@leetcode.com","b@leetcode.com","c@leetcode.com"]
["a@leetcode.com","b@leetcode.com","c@leetcode.com"]--> all normal, all unique returns 3


["test.email+alex@leetcode.com","test.e.mail+bob.cathy@leetcode.com","testemail+david@lee.tcode.com"]
["testemail@leetcode.com","testemail@leetcode.com","testemail@lee.tcode.com"]--> 2 unique email addresses 

Data Structures:
interim: arrays 
O: int 

Algorithm:
- iterate over input array 
  - split the string at @ first item is `local_name` and second is`domain_name`

- delete periods from the local_name--> emails get forwarded anyway 
- identify the index of the first `+`
  - reassign local_name to local_name from 0 index up to and not including the indext at the `+`

- join back the local_name and domain_name with a '@' to get the actual email they direct to 
- get unique emails 
=end 

def f(arr)
  arr.map do |email|
    local_name, domain_name = email.split('@')
    local_name.delete!('.')
    if local_name.chars.include?('+')
      local_name = local_name[0...local_name.index('+')]
    else
      local_name
    end
    clean_email = local_name + '@' + domain_name
  end.uniq.size
end

p f(["test.email+alex@leetcode.com","test.e.mail+bob.cathy@leetcode.com","testemail+david@lee.tcode.com"]) == 2
p f(["a@leetcode.com","b@leetcode.com","c@leetcode.com"]) == 3
p f(["test.email+alex@leetcode.com","test.email.leet+alex@code.com"]) == 2
