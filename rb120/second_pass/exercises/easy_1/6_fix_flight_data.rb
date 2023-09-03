# Consider the following class definition:

class Flight
  attr_accessor :database_handle

  def initialize(flight_number)
    @database_handle = Database.init
    @flight_number = flight_number
  end
end

# There is nothing technically incorrect about
# this class, but the definition may lead to problems
# in the future. How can this class be fixed to be
# resistant to future problems?

# S:
# we don't want to give access to the databse_handle instance variable because someone could
# actually use it in code and corrupt the intended use and break the code
