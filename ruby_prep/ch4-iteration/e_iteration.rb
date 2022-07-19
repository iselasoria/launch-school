# E1 what does the each method in the following program return after it's finished executing?
x = [1, 2, 3, 4, 5]
x.each do |a|
  a + 1
end
# it returns the original collection-- each always returns the original collection it was called on 

# E2 Write a while loop that takes input from the user, performs an
# action, and only stops when the user types "STOP". Each loop can get info from the user.
x = ""
while x != "STOP" do
  puts "Give me some input: "
  text = gets.chomp
  puts "want me to ask again?"
  x = gets.chomp
end
# E3 Write a method that counts down to zero using recursion.

def countdown(num)
  puts num
  if num > 0
    countdown(num -= 1)
  end
end

countdown(10)