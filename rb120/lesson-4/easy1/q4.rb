=begin 
If we have a class AngryCat how do we create a new instance of this class?

The AngryCat class might look something like this:
=end 

class AngryCat
  def hiss
    puts "Hisssss!!!"
  end
end

# S: 
mad_kitty = AngryCat.new # this method returns a new object of the calling class. It triggers the constructor, too 