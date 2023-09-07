# consider the following
class Wallet

  include Comparable

  def initialize(amount)
    @amount = amount
  end

  def <=>(other_wallet)
    amount <=> other_wallet.amount
  end

  protected
  attr_reader :amount
end

bills_wallet = Wallet.new(500)
pennys_wallet = Wallet.new(465)
if bills_wallet > pennys_wallet
  puts 'Bill has more money than Penny'
elsif bills_wallet < pennys_wallet
  puts 'Penny has more money than Bill'
else
  puts 'Bill and Penny have the same amount of money.'
end


# S: here the solution is to add a protected attr_reader for the ivar @amount
# we need to have it protected instead of private because in the comparison method, we want one instnace to be
# able to look into the state of another and private methods are only available
# to the current instance of the class, this is why we have to use protected.
# one real life scenario of this use case would be to check if an ID is the same,
# to ensure it is not duplicated but we don't want it to be retrievable from the outside
