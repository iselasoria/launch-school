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

# E4 See if the name 'Dino' appears in the string:
advice = "Few things in life are as important as house training your pet dinosaur."
p advice.include?('Dino')

# E5 Show an easier way to write this aaray:
flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]
# SOLUTION
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
p flintstones

# E6 How can we add the family pet 'Dino' to the array:
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones << 'Dino'
p flintstones

# E7 In the previous practive problem we added Dino, we could have used `Array#concat` or `Array#push`
# how can we add multiple items to the array (Dino and Hoppy)?
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.push("Dino").push("Hoppy")   # push returns the array so we can chain

# E8 Shorten the sentence:
advice = "Few things in life are as important as house training your pet dinosaur."
# read `String#slice!` and use that method "Few things in life are as important as ". 
# But leave the advice variable as "house training your pet dinosaur.".
# As a bonus, what happens if you use the String#slice method instead?

advice.slice!(0..38)
p advice

# using the non-destructive `slice` would have returned a new string with the text "Few things in life are as important as "
# but the original would still be poiting to the full sentence.

# E9 write a one-liner to count the number of lower-case 't' characters in:
statement = "The Flintstones Rock!"

p statement.count('t')

# E10 If we had a table 40 characters wide, how could we center the string:
title = "Flintstone Family Members"

# SOLUTION
p title.center(40)
