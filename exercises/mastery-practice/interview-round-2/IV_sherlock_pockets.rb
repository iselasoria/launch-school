=begin 
* DONE 8m57s
Sherlock has to find suspects on his latest case. He will use your method, dear Watson. Suspect in this case is a person which has something not allowed in his/her pockets.

Allowed items are defined by array of numbers.

Pockets contents are defined by map entries where key is a person and value is one or few things represented by an array of numbers (can be nil or empty array if empty), example:

pockets = { 
  bob: [1],
  tom: [2, 5],
  jane: [7]
} 
Write method which helps Sherlock to find suspects. If no suspect is found or there are no pockets (pockets == nil), the method should return nil.

find_suspects(pockets, [1, 2]) # => [:tom, :jane]
find_suspects(pockets, [1, 7, 5, 2]) # => nil
find_suspects(pockets, []) # => [:bob, :tom, :jane]
find_suspects(pockets, [7]) # => [:bob, :tom]


I: hash and array 
O: array 

Rules:
- returns nil if there are no suspects or if there are no pockets 
  - there might not be suspects if people have all of their items accounted for in the allowed
- if any person has a bag with contents that include anything NOT on the receipt, they are a suspect 
- empty receipts mean everyone who has items is a suspect 

DS:
hash and array

Algorithm:
- return nil if pockets is nil or if there are no suspects

- init suspects to empty array 
- line people up--> iterate over people_lineup hash 
  - for each person in the hash 
    - iterate over their bag contents 
      - if any of their items are NOT on their receipt
        - put them in the suspects array 

if suspects is empty, return nil otherwise return suspects 
=end 

# test cases 
pockets = { 
  bob: [1],
  tom: [2, 5],
  jane: [7]
} 

def find_suspects(people_lineup, receipt)
  return nil if people_lineup.nil? 

  suspects = []

  people_lineup.each do |person, bag|
    bag.each do |contents|
      suspects << person if !receipt.include?(contents)
    end
  end
  suspects.empty? ? nil : suspects.uniq
end


p find_suspects(pockets, [1, 2]) == [:tom, :jane]
p find_suspects(pockets, [1, 7, 5, 2]) == nil
p find_suspects(pockets, []) == [:bob, :tom, :jane]
p find_suspects(pockets, [7]) == [:bob, :tom]