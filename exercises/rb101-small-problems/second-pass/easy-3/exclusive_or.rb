=begin
Write a method namex `xor` that takes two arguments, and returns true if exactly one 
argument is truthy, false otherwise. 
=end

def xor?(con1, con2)
  if con1 == true && con2 == false
    true
  elsif con1 == false && con2 == true
    true
  else
    false
  end
end

# test cases
p xor?(5.even?, 4.even?) == true
p xor?(5.odd?, 4.odd?) == true
p xor?(5.odd?, 4.even?) == false
p xor?(5.even?, 4.odd?) == false