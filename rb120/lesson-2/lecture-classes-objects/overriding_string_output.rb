=begin 
Override the to_s method that was inherited. What does the code print now?

=end

class Person
  attr_accessor :first_name, :last_name

  
  def initialize(full_name)
    parts = full_name.split
    @first_name = parts.first 
    @last_name = parts.size > 1 ? parts.last : ""
  end

  def name
    "#{first_name} #{last_name}".strip
  end

  def name=(full_name)
    parts = full_name.split 
    self.first_name = parts.split 
    self.last_name = parts.size > 1 ? parts.last : "" 
  end 

  def to_s 
    name
  end
end

bob = Person.new('Joe Moore')

puts "The person's name is: #{bob}"
