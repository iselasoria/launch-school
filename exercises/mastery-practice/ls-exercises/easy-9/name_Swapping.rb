=begin 
Write a method that takes a first name, a space, and a last name passed as a single String argument, and returns a string that contains the last name, a comma, a space, and the first name.

I: srting 
O: string 

Rules:
- return last, comma, space, first

=end 
def swap_name(str)
  full = str.split
  full[1] + ', ' + full[0]
end


# test cases 

p swap_name('Joe Roberts') == 'Roberts, Joe'