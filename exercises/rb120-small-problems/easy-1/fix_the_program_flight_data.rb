# Consider the following class definition:

class Flight
  attr_accessor :database_handle

  def initialize(flight_number)
    @database_handle = Database.init
    @flight_number = flight_number
  end
end


# There is nothing technically incorrect about this class, but the definition may
# lead to problems in the future. 
# How can this class be fixed to be resistant to future problems?

# SOLUTION
# By using attr_accessor, we are giving the whole program too much access to both set, and read data. This
# can be problematic because what if we are trying to read data for a scheduled flight, but we accidentally 
# overwrite existing data? 