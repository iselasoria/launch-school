################################################################################################
# ! Deleting all but alphanumeric
# * English Breakdown
# String#delete can remove all but the items passed with the excluding expression
# * Ruby Breakdown

str1 = "messa4ge"
str1 = str1.delete('^a-z')
p str1

str2 = "This is a poluted text messa4ge &%"
str2 = str2.delete('^a-zA-Z0-9') # notice this deletes spaces too
p str2 

################################################################################################
# ! Name of Algorithm
# * English Breakdown
# * Ruby Breakdown

str0 = "The quick brown fox jumps over the lazy fox"

# find the consonants 
p str0.scan(/[^aeiou ]/)
puts "\n"
# find the vowels 
p str0.scan(/[aeiou]/)

puts "\n"

# order alphabetically, case irrelevant 
str1 = "Goliath"
sorted = str1.chars.sort do |ch1, ch2| 
          ch1.casecmp(ch2)
        end

p sorted

puts "\n"

# replace 4 characters in a string with "john", starting at index of m
str2 = "Onomatopeia"

p str2[str2.index('m'), 4] = 'john'
p str2 
puts "\n"

# get the index of the last occurrence of a characacter
str3 = "fizzbuzz"
p str3.rindex('z')
puts "\n"

# get the index of the first occurence of a character 
p str3.index('z')
puts "\n"

# remove the last character of the string 
str4 = "plurals"

p str4.chop! # can be non-mutating 
p str4 

puts "\n"

# add a chunk before a given string 
str5 = "defined"
p str5.prepend("un")

puts "\n"

# padded strings 
# left 
str6 = "Isela"
p str6.ljust(10,"x")

# right 
p str6.rjust(10, "x")

puts "\n"

# string center 
p str6.ljust(10,"x")
p str6.center(10, 'o')

# string scanning 
str7 = "codewarriors"

p str7.scan(/[aeiou]/) # ["o", "e", "a", "i", "o"] single element
p str7.scan(/[aeiou]+/) # ["o", "e", "a", "io"] allows for substrings

str8 = "Buuuurbus"

p str8.scan(/[u]/) # ["u", "u", "u", "u", "u"] all instances of the search term
p str8.scan(/[u]+/) # ["uuuu", "u"]

p str8.scan(/[b]+/) # ["b"]
p str8.scan(/[Bb]+/) # ["B", "b"]