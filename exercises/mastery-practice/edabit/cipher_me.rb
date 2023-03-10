=begin 
* DONE 18m18s
Create a function that takes a string and replaces every letter with the letter following it in the alphabet ("c" becomes "d", "z" becomes "a", "b" becomes "c", etc). Then capitalize every vowel (a, e, i, o, u) and return the new modified string.

Examples
mangle("Fun times!") ➞ "GvO Ujnft!"
mangle("The quick brown fox.") ➞ "UIf rvjdl cspxO gpy."
mangle("Omega") ➞ "Pnfhb"

Notes
  If a letter is already uppercase, return it as uppercase (regardless of being a vowel).
  "y" is not considered a vowel.


I: string 
O: string 

Rules:
- alphabet wrapping --> 'z'-> 'a'
- replace each letter with its successor in the alphabet
- capitalize every returning, successor vowel 
- special characters stay, including space --> iterate at character level 

Examples:
"Fun times!"
 gvo ujnft!
 Gvo Ujnft!

"The lake is a long way from here."
 uif mblf jt b mpoh xbz gspn ifsf 
 Uif mblf jt b mpOh xbz gspn Ifsf 

 DS:
 I: string 
 Interm: array 
 O: stirng 

 Algorithm:
 - init collection_chars = []
 - iterate over string chars --> transform
  - if capital, successor of capital
  - if lowercase successor of lowercase
  - if special 
      return as is 
  - if char is 'z', successor first item 

# map again to upcase vowels 
  - iterate through and capitalize vowels 
=end 

def mangle(str)
  collection_chars = str.chars

  collection_chars.map! do |ch|
    if !(('a'..'z').to_a + ('A'..'Z').to_a).include?(ch)
      ch 
    elsif ch == 'z'|| ch == 'Z'
      ch.succ.chars.first
    elsif ch == ch.upcase 
      ch.upcase.succ
    elsif ch == ch.downcase 
      ch.succ
    end 
  end
  collection_chars.map! do |item|
    if %w(a e i o u).include?(item)
      item.upcase 
    else
      item
    end
  end.join

end

p mangle("Fun times!") == "GvO Ujnft!"
p mangle("Omega") == "Pnfhb"
p mangle("I will never be this young again. Ever. Oh damn... I just got older.") == "J xjmm Ofwfs cf UIjt zpvOh bhbjO. Fwfs. PI EbnO... J kvtU hpU pmEfs."
p mangle("Should we start class now, or should we wait for everyone to get here?") == "TIpvmE xf tUbsU dmbtt Opx, ps tIpvmE xf xbjU gps fwfszpOf Up hfU Ifsf?"
p mangle("Check back tomorrow; I will see if the book has arrived.") == "DIfdl cbdl Upnpsspx; J xjmm tff jg UIf cppl Ibt bssjwfE."
p mangle("The lake is a long way from here.") == "UIf mblf jt b mpOh xbz gspn Ifsf."
p mangle("It was getting dark, and we weren't there yet.") == "JU xbt hfUUjOh Ebsl, bOE xf xfsfO'U UIfsf zfU."
p mangle("The mysterious diary records the voice.") == "UIf nztUfsjpvt Ejbsz sfdpsEt UIf wpjdf."
p mangle("Cats are good pets, for they are clean and are not noisy.") == "DbUt bsf hppE qfUt, gps UIfz bsf dmfbO bOE bsf OpU Opjtz."
p mangle("abcz") == "bcdA"
p mangle("ABCZ") == "BCDA"