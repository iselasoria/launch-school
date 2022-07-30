# E1 In this hash of people and their age:
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
# see if "Spot" is present. Bonus: What are two other hash methods that would work just as well for this solution?
p ages.key?("Spot")
p ages.include?("Spot")
p ages.member?("Spot")


# E2 Starting with this tring:
munsters_description = "The Munsters are creepy in a good way."
# convert the string in the following ways:
# "tHE mUNSTERS ARE CREEPY IN A GOOD WAY."
# "The munsters are creepy in a good way."
# "the munsters are creepy in a good way."
# "THE MUNSTERS ARE CREEPY IN A GOOD WAY."

=begin
SOLUTION
=end
p munsters_description.swapcase!
p munsters_description.capitalize!
p munsters_description.downcase!
p munsters_description.upcase!


# E3 Given this hash:
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
p ages
# add the following members to it
additional_ages = { "Marilyn" => 22, "Spot" => 237 }

ages.merge!(additional_ages)

p ages
