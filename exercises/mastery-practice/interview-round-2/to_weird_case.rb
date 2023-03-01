# * DONE 14m36s
# Write a method named to_weird_case that accepts a string, and
# returns the same sequence of characters with every 2nd character
# in every third word converted to uppercase. Other characters
# should remain the same.
=begin
I: string 
O: string 

Rules:
  - every third word gets altered 
  - every 2nd character gets upcased 
  - implicit: space does'nt matter 

Examples:
          'Lorem Ipsum is simply dummy text of the printing'
Changes:               X                X           X  
                       iS              tExT        pRiNtInG 

DS:
arrays 

Algorithm:
- iterate over the words in the string 
  - if index is multiple of 3
    - iterate over the characters in the word 
      - if the index of the character is odd, upcase 
  - otherwise 
    - leave word as is
=end 
def to_weird_case(str)
  words = str.split 

  word_deltas = (1..words.size).select {|i| i % 3 == 0}.map{|item| item - 1}

  words.map.with_index do |word, idx|
    if word_deltas.include?(idx)
      word.chars.each_with_index do |letter, l_idx|
        if l_idx.odd? 
          letter.upcase!
        end
      end.join
    else 
      word
    end
  end.join(' ')
end

# Examples:

p to_weird_case('Lorem Ipsum is simply dummy text of the printing') =='Lorem Ipsum iS simply dummy tExT of the pRiNtInG'
p to_weird_case('It is a long established fact that a reader will be distracted') =='It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
p to_weird_case('aaA bB c') == 'aaA bB c'
p to_weird_case('Miss Mary Poppins word is supercalifragilisticexpialidocious') =='Miss Mary POpPiNs word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS'

# The tests above should print "true".