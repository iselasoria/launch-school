# Alan created the following code to keep track of items for a shopping 
# cart application he's writing:

class InvoiceEntry
  attr_reader :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    # prevent negative quantities from being set
    quantity = updated_count if updated_count >= 0
  end
end

# Alyssa looked at the code and spotted a mistake. 
# "This will fail when update_quantity is called", she says.

# Can you spot the mistake and how to address it?

# S:
# the quantity on line 14 is a local variable as it is because we have a getter method, but no setter
# we could either reference the ivar with an @ or we could make an attr_accessor and then prepend the self 
# keyword to the quantity so it knows we want to reference the setter method of the instance 