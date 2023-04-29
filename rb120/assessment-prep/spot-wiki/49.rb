number = 42

case number
when 1          then p 'first' # Integer#===
when 10, 20, 30 then p 'second' # Integer#===
when 40..49     then p 'third' #Range#===
end


# What methods does this `case` statement use to determine which `when`
# clause is executed?

# S:
# the case state always used the #=== but determiens individual implementation based on the data type
# so fors the first two Integer#=== and Range#=== for the last
