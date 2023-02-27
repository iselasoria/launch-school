=begin 
Create a function validate() that takes a string email address and returns true if valid, false otherwise.

A valid email is defined as:
  Has an @ symbol within
  Has dots splitting up two or more strings at the right of the @.
  Has contents to the left of the @. Only one part is needed. Multiply parts should be seperated with dots.

For example:
  validate('joe@example.com') => true
  validate('joe.codewars@example.com') => true
  validate('joe') => false # does not contain @ symbol, does not contain two or more strings seperated by a dot after the @ symbol
  validate('@.') => false #nothing to the left of the @, does not adhere to rule 2 in the description

I: string 
O: boolean 

Rules:
- must contain a @ 
- words can be separated by a dot before the @ 
- there must be a single period after the @ 

DS: 
I- string 
Interim: arrays 
O: boolean 

Algorithm:
- return false when you don't find the @

- split word from 0 index up to and not including the @ store as `email_name`
- split word from index of @ + 1, to the end `trailing`
- check that `email_name` only contains letters and .
- check that trailing contains a single . 

=end 

def validate(str)
  return false if !str.chars.include?('@')
  return false if str.chars.last == '@' || str.chars.first == '@'

  email_name = str[0...str.index('@')]
  trailing = str[str.index('@') + 1..-1]

  all_allowed = email_name.downcase.chars.all? {|char| (('a'..'z').to_a << ('.') << ('-')).include?(char)} 
  only_one_period = trailing.count('.') == 1
  letters_after_period = trailing.chars.last != '.'
  next_to_at = str.chars[(str.chars.index('@') + 1)] != '.'

  all_allowed && only_one_period && letters_after_period && next_to_at

end

# test cases 
# test cases 
p validate( 'joe@example.com' ) == true
p validate( 'joe' ) == false
p validate( 'bob.Brown@example.info' ) == true
p validate("Jack-Brown@example-server.co") == true 
p validate("joe@example") == false 
p validate("joe@.com") == false 

