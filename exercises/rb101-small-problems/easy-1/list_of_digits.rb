=begin
Write a method that takes an argument, a positive integer, and 
returns a list of the digits in that number
puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true
=end


def digit_list(number)
  number.to_s.chars.map do |item|
    item.to_i
  end
  # (&:to_i)
end

p digit_list(2341)