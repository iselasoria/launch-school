# Complete this program so that it produces the expected output:

class Book
  attr_reader :title, :author
  def initialize(author, title)
    @author = author
    @title = title
  end

  def to_s
    %("#{title}", by #{author})
  end
end

book = Book.new("Neil Stephenson", "Snow Crash")
puts %(The author of "#{book.title}" is #{book.author}.)
puts %(book = #{book}.)

# expected
# The author of "Snow Crash" is Neil Stephenson.
# book = "Snow Crash", by Neil Stephenson.

=begin
Further Exploration
The differences between the types of accessors:
  - attr_reader--> gives us access to view, or read the value of an instance variable; creates getter method
  - attr_writer --> gives us access to write the value of an instance variable; creates setter method
  - attr_accessor --> gives us both, essentially creates getter/setter methods 

In this case, since we only need to read it as specified in lines 16 and 17, we don't need to have a setter method created with 
an accessor method. Upon instantiation, these instance variables are set and since that's all the functionality we need for setting them
we only use the reader method to retrieve their data. We could define the getters and setters ourselves if we wanted to override functionality
=end 
