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