def is_icecream_sandwich(str)
  return false if str.empty?
  chars = str.chars

  layer1, filling, layer2 = chars.slice_when {|a, b| a!= b}.to_a
  layer1 == layer2 && layer1 != filling ? true : false


end 


p is_icecream_sandwich("") == false
p is_icecream_sandwich("AABBBAA") == true
p is_icecream_sandwich("3&&3") == true
p is_icecream_sandwich("yyyyymmmmmmmmyyyyy") == true
p is_icecream_sandwich("hhhhhhhhmhhhhhhhh") == true
p is_icecream_sandwich("CDC") == true
p is_icecream_sandwich("BBBBB") == false
p is_icecream_sandwich("AAACCCAA") == false
p is_icecream_sandwich("AACDCAA") == false
p is_icecream_sandwich("AAABB") == false
p is_icecream_sandwich("AA") == false
p is_icecream_sandwich("A") == false


# # b = [5,22,1,9,4,6]
# puts "Slice When method : #{b.slice_when {|ch| !%w(a e i o u).include?(ch) }.to_a}"
# puts "Slice Before method : #{b.slice_before {|ch| !%w(a e i o u).include?(ch)}.to_a}"
# puts "Slice After method : #{b.slice_after {|ch| !%w(a e i o u).include?(ch)}.to_a}"