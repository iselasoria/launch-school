=begin
You are given a method named spin_me that takes a string as an argument and returns a string that contains the same words, but with each word's characters reversed. Given the method's implementation, will the returned string be the same object as the one passed in as an argument or a different object?
=end

def spin_me(str)
  str.split.each do |word|
    word.reverse!
  end.join(" ")
end

spin_me("hello world") # "olleh dlrow"

# this returns a new object. Despite the fact that each returns the original collection, and that we use a mutating method .reverse!,
# as soon as we split the string on line 6 we were acting on a new object and therfore, the return of this method is a new object.