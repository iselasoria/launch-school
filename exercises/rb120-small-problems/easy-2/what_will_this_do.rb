# what will the code print?
class Something
  def initialize
    @data = 'Hello' # instantiates an instance method called @data
  end

  def dupdata
    @data + @data # instance method concatenates data with data 
  end

  def self.dupdata # class method even though it's called the same as the instance method above, it is not the same!
    'ByeBye'
  end
end

thing = Something.new
puts Something.dupdata # this outputs `ByeBye`
puts thing.dupdata # this outputs `HelloHello`