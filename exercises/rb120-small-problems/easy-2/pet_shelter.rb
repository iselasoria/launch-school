# Consider the following code:
=begin
# Lines 3 through 9 instantiate Pet objects 
butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')
# these two instantiate Owner objects
phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

# Instantiates a Shelter object 
shelter = Shelter.new
shelter.adopt(phanson, butterscotch) # the adopt method pair up and owner wit their newly adopted pet
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)
shelter.print_adoptions # lets us see the adoptions  in the format
                        # P Hanson has adopted the following pets:
                        # a cat named Butterscotch
                        # a cat named Pudding
                        # a bearded dragon named Darwin
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets." # makes a call to Owner instance methods
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets." # makes a call to Owner instance methods
=end 
class Shelter

  def initialize
    @adoptions = {}
  end

  def adopt(pawrent, furriend) # takes in objects of the Person class 
    pawrent.adoption_tally(furriend)
    @adoptions[pawrent.name]||= pawrent
  end 
  #   @@number_of_pets += 1 # track each time a pet gets adopted
  #   @all_pets = []  #track the number of pets but we want them to belong to an instance, of Person so can't be clas 
  #   @all_pets << furriend.name # each time a pet gets adopted, it gets added to that person's list
  # end
  # print adoptions 
  def print_adoptions
    @adoptions.each_pair do |name, pawrent|
      puts "#{name} has adopted the following pets:"
      pawrent.print_pets
      puts
    end
  end
end

class Pet
  attr_reader :type, :name, :number_of_pets

  @pet_arr = []
  def initialize(type, pet_name)
    @type = type 
    @name = pet_name
  end
  def to_s
    "a #{type} named #{name}"
  end
end

class Owner
  attr_reader :name, :number_of_pets
  def initialize(name)
    @name = name 
    @pet_arr = []
  end

  def adoption_tally(pet)
    @pet_arr << pet
  end
  def number_of_pets
    @pet_arr.size
  end
  def print_pets
    puts @pet_arr
  end
end






butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')
burbus       = Pet.new('cat', 'Burbujita')


phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')
xela    = Owner.new('Xela')

shelter = Shelter.new
shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)
shelter.adopt(xela, burbus)
shelter.print_adoptions
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."
puts "#{xela.name} has #{xela.number_of_pets} adopted pets."

#TODO come back to implement the further exploration