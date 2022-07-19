# E1 write a program that checks if the sequence of characters "lab" exists in the following strings. If it does, print it out.
arre = ["laboratory","experiment","Pans Labyrinth","elaborate","polar bear"]

def checker(word)
  if /lab/ =~ word
    puts word
  else
    puts "No Match"
  end
end

arre.each do |item|
  checker(item)
end