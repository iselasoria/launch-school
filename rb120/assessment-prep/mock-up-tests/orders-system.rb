# The following is a short description of an application that lets a customer place an order for a meal:

# - A meal always has three meal items: a burger, a side, and drink.
# - For each meal item, the customer must choose an option.
# - The application must compute the total cost of the order.

# 1. Identify the nouns and verbs we need in order to model our classes and methods.
# 2. Create an outline in code (a spike) of the structure of this application.
# 3. Place methods in the appropriate classes to correspond with various verbs.


=begin
NOUNS:
- customer
  - meal / order
    - total cost
    - meal items
      - options
      - cost

VERBS:
- place order
- choose
- calculate


class Customer

class MealOrder

class MealItem

class Burger < MealItem
  option 1 - cheese burger
  option 2 - veggie burger
class Side < MealItem
  option 1 - fries
  option 2 - onion rings
class Drink < MealItem
  option 1 - soda
  option 2 - juice
=end


class Customer
  attr_accessor :order

  def initialize(name)
    @name = name
    @order = nil
  end

  def place_order
    self.order = Order.new
  end
end

class Order
  attr_reader :burger, :side, :drink

  def initialize
    @burger = Burger.new # goes to choose
    @side = Side.new
    @drink = Drink.new
  end

  def meal
    [@burger, @side, @drink]
  end

  def total_cost
    @burger.cost + @side.cost + @drink.cost
  end

  def to_s
    meal.map(&:to_s).join(", ") + "=> $#{total_cost}"
  end
end

class MealItem
  attr_accessor :option

  def initialize
    @option = choose_option
  end

  def choose_option
    answer = nil
    puts "Please choose a #{self.class} option:"
    item_options # item_options returns a list of options and prices
                      # for a particular item type
    answer = gets.chomp.to_i
    self.class::OPTIONS[answer] # should be returned ie) cheese burger
  end

  def item_options
    self.class::OPTIONS.each do |k,v|
      puts "   Option #{k}: $#{v[:cost]} #{v[:name]}"
    end
  end

  def cost
    option[:cost]
  end

  def to_s
    option[:name]
  end
end

class Burger < MealItem
  OPTIONS = {
    1 => { name: "cheese burger", cost: 10},
    2 => {name: "veggie burger", cost: 12}
  }
end

class Side < MealItem
  OPTIONS = {
    1 => {name: "fries", cost: 2.25},
    2 => {name: "salad", cost: 3.25}
  }
end

class Drink < MealItem
  OPTIONS = {
    1 => {name: "soda", cost: 2.25},
    2 => {name: "juice", cost: 2.75}
  }
end

snugz = Customer.new("Snugz")
snugz.place_order
puts snugz.order
