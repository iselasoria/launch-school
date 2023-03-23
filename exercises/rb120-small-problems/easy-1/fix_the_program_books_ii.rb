# Complete this program so that it produces the expected output:

class Book
  attr_accessor :title, :author
  
  def to_s
    %("#{title}", by #{author})
  end
end

book = Book.new
book.author = "Neil Stephenson"
book.title = "Snow Crash"
puts %(The author of "#{book.title}" is #{book.author}.)
puts %(book = #{book}.)

# expected:
# The author of "Snow Crash" is Neil Stephenson.
# book = "Snow Crash", by Neil Stephenson.

=begin
Further Exploration
One potential problem that arise when we create and iniitialize in separate steps is that 
we loose the ability to expand the functionality upon instantiation. For example, having validation of input
as it gets entered. 
=end 