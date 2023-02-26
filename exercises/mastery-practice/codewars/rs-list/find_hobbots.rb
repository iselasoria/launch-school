=begin 
https://www.codewars.com/kata/55703a2a52dd10501c000131/ruby

You are a lonely hobbit, and you've been given a manifest of all the residents in this side of the country. The manifest is an array of hashes, that have the form: {name: 'string', race: 'string', home: 'string'}

You want to find all of the other hobbits! Your task is to return an array from a given manifest that contains all of the potential halflings in the list. From your experience you know that hobbits don't always follow the rules, and some may have entered their race under their home and vice versa. You also know that some hobbits will refer to themselves as halflings, and that popular homes for hobbits include the shire, south farthing, and hobbiton.

TLDR; For a given array of hashes of the form {name: 'string', race: 'string', home: 'string'}, return an array of all the objects that have the words halfling,hobbit,shire,farthing, or hobbiton anywhere within the race or home field.


manifest = [
  {name:'Aragorn', race:'Human', home:'Kingdom of Men'},
  {name:'Bilbo', race:'Hobbit', home:'The Shire'},
  {name:'Tom Bombadil', race:nil, home:'The Forest'}
]

find_hobbits_in(manifest) == [{name:'Bilbo', race:'Hobbit', home:'The Shire'}]


## halfling???

I: array of hashes 
O: array of hashes 

Rules:
- Characteristics of a Hobbit 
  - race--> Hobbit or halfling or half-halfling
  - home --> Shire, South Farthing, Hobbiton
  - case is all over the place, need to standardize!

Goal: return the hashes in the array of hashes (still as an array) that contain any of the above Characteristics

Data Structure:
I: array of hashes 
Interim: arrays and hashes 
O: array 

Algorithm:
- define hobbit_characteristics as an array of Hobbit qualities #[Shire, Hobbiton, etc]
- iterate over the manifest array # select the hash if it finds Hobbit Characteristics # check if their downcase version is a cahractersitic
  - iterate over the hash to see if any of the keys include hobbit Characteristics
=end 

# def find_hobbits_in(manifest)
#   hobbit_characteristics = ['shire', 'south farthing', 'hobbiton', 'hobbit','halfling'] # variation in plural mattters?

#   potential_hobbit = []
#   manifest.each do |person|
#     person.values.each do |desc| # ["Bilbo", "Hobbit", "The Shire"]<--description of person 
#       next if desc.nil?
#       if hobbit_characteristics.any? {|quality| quality.include?(desc.downcase)}
#         potential_hobbit << person
#       end
#     end
#   end 
# potential_hobbit
# end

def find_hobbits_in(manifest)
  hobbit_characteristics = ['shire', 'south farthing', 'hobbiton', 'hobbit','halfling'] # variation in plural mattters?

  potential_hobbit = []
  manifest.each do |person|
    person.values.select do |quality|
      next if quality.nil?
      hobbit_characteristics.each do |hc|
        # if !quality.scan(hc).empty?
        #   potential_hobbit << person
        # end
        if quality.downcase.include?(hc)
          potential_hobbit << person
        end
      end 
    end
  end
  potential_hobbit.uniq
end

# {|q| q.match?(/"#{desc.downcase}"/)}

# test cases 
manifest = [
  {name:'Aragorn', race:'Human', home:'Kingdom of Men'},
  {name:'Bilbo', race:'Hobbit', home:'The Shire'},
  {name:'Tom Bombadil', race:nil, home:'The Forest'}
]

p find_hobbits_in(manifest) == [{name:'Bilbo', race:'Hobbit', home:'The Shire'}]


manifest = [
  {:name=>"Joe", :race=>"Human", :home=>"Bree"}, 
  {:name=>"Dwalin", :race=>"Dwarve", :home=>"the mountain"}, 
  {:name=>"Loen", :race=>"Hobbit", :home=>" "}, 
  {:name=>"Oen", :race=>nil, :home=>"South Farthing"}
]

p find_hobbits_in(manifest) == [{:name=>"Loen", :race=>"Hobbit", :home=>" "}, {:name=>"Oen", :race=>nil, :home=>"South Farthing"}]

manifest = [{:name=>"Ferino", :race=>"human", :home=>nil}, 
            {:name=>"Oren", :race=>"half-halfling", :home=>nil},     
            {:name=>"Roren", :race=>"hobbiton//bree", :home=>nil}, 
            {:name=>"Bilbo", :race=>"hobbit", :home=>"the shire"}, 
            {:name=>"Pippin", :race=>nil, :home=>nil}]
            
p find_hobbits_in(manifest) == [{:name=>"Oren", :race=>"half-halfling", :home=>nil}, {:name=>"Roren", :race=>"hobbiton//bree", :home=>nil}, {:name=>"Bilbo", :race=>"hobbit", :home=>"the shire"}]

############ ATTEMPT
str1 = 'hal'
str2='half-halfling'
hobbit_characteristics = ['shire', 'south farthing', 'hobbiton', 'hobbit','halfling'] 
qualities = ["Ferino","human",nil],["Oren","half-halfling",nil],["Roren","hobbiton//bree",nil],["Bilbo","hobbit","the shire"],["Pippin",nil,nil]

# p str2 =~ /str1/
# p str2.scan(str1)
# p /halfling/.match?('half-halfling')

hobs = []
qualities.each do |person_list| #["Oren", "half-halfling", nil]
  person_list.select do |quality|
    next if quality.nil?
    hobbit_characteristics.each do |hc|
      # p quality 
      # p hc 
      puts "Now scanning #{quality} to see if we find: #{hc}."
     if !quality.scan(hc).empty?
      hobs << person_list
     end
    #  p hc.scan(quality)
    end
  end
end
p hobs.uniq