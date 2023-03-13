=begin 
Write a function that takes a string and returns a string with the correct case for character titles in the Game of Thrones series.

    The words and, the, of and in should be lowercase.
    All other words should have the first character as uppercase and the rest lowercase.

Examples
correct_title("jOn SnoW, kINg IN thE noRth.")
➞ "Jon Snow, King in the North."

correct_title("sansa stark, lady of winterfell.")
➞ "Sansa Stark, Lady of Winterfell."

correct_title("TYRION LANNISTER, HAND OF THE QUEEN.")
➞ "Tyrion Lannister, Hand of the Queen."

Notes

    Punctuation and spaces must remain in their original positions.
    Hyphenated words are considered separate words.
    Be careful with words that contain and, the, of or in.
    See the Resources tab for more info on the various Ruby string methods.

I: string 
O: string 

Rules:
- Hyphenated words are separate words 
- punctuation matters and must remain in place 
- prepositions should be lowercase 
- all other words should be capitalized 

Examples:
                              "jOn SnoW, kINg IN thE noRth."
make note of punctuation index         8                  20 
prepositions = [of, the, in, and]
standardize:                    jon snow, king in the north. 
capitalize unless prep:         Jon Snow, King in the North. 


                          "GRAND MAESTER PYCELLE."
                          grand maester pycelle 
                          Grand Maester Pycelle

            "jaime lannister, lord commander of the kingsguard."
            "jaime lannister, lord commander of the kingsguard."
             Jaime Mannister  Lord Commander of the Kingsguard
                            ^                                 ^

DS:
I: string 
Interm: arrays and hashes 
O: string 

Algorithm:
- init preposition to hold "and, of, in, the" --> `prepositions_arr` 
- downcase the whole string 
- make a note of punctuation and its index in original string store in `puct_place`
- delete all but a-z, space or dash 


- split the sentence by dash # ["mance rayder king","beyond", "the","wall"]
  - split each element again and iterate
    - capitalize each word unless its a preposition
    - join with a space 

- slide pucntuatiuon back into original position --> iterating over the joined string 
  - insert hash pucntuation at the index stored 
- return modified string 
=end 
def correct_title(str)
  prepositions_arr = %w(and the in of )

  str = str.downcase

  # punct_place = {}

  # str.chars.each_with_index do |ch, idx|
  #   if !('a'..'z').to_a.include?(ch)
  #     punct_place[idx] = ch 
  #   end 
  # end
  # punct_place.select! {|k,v| v != ' '}

  # str = str.delete('^a-z -')

  words = str.split

  words.map do |chunk|
    if chunk.include?('-')
      # split again , cap, join back with dash 
      chunk = chunk.split(/-/).map! do |word|
        prepositions_arr.include?(word) ? word : word.capitalize!
      end.join('-')
    else
       chunk.capitalize! unless prepositions_arr.include?(chunk)
    end 
    chunk 
   
  end.join(' ')


end 

p correct_title("sansa stark, lady of winterfell.") == "Sansa Stark, Lady of Winterfell."
p correct_title("lord eddard stark, hand of the king.") == "Lord Eddard Stark, Hand of the King."
p correct_title("jaime lannister, lord commander of the kingsguard.") == "Jaime Lannister, Lord Commander of the Kingsguard."
p correct_title("varys, master of whisperers.") == "Varys, Master of Whisperers."
p correct_title("doran martell, prince of dorne, lord of sunspear.") == "Doran Martell, Prince of Dorne, Lord of Sunspear."
p correct_title("TYRION LANNISTER, HAND OF THE QUEEN.") == "Tyrion Lannister, Hand of the Queen."
p correct_title("GRAND MAESTER PYCELLE.") == "Grand Maester Pycelle."
p correct_title("EURON GREYJOY, KING OF THE IRON ISLANDS, LORD REAPER OF PYKE.") == "Euron Greyjoy, King of the Iron Islands, Lord Reaper of Pyke."
p correct_title("PETYR BAELISH, LORD PROTECTOR OF THE VALE.") == "Petyr Baelish, Lord Protector of the Vale."
p correct_title("MANCE RAYDER, KING-BEYOND-THE-WALL.") == "Mance Rayder, King-Beyond-the-Wall."
p correct_title("jOn SnoW, kINg IN thE noRth.") == "Jon Snow, King in the North."
p correct_title("Jeor MORMONT, Lord COMMANDER of the NIGHT'S WATCH.") == "Jeor Mormont, Lord Commander of the Night's Watch."
p correct_title("cERSei LANnIStEr, QuEEn Of the aNdals and THE fIRSt men, PROtecTOR OF tHe SEVEN KInGdOmS.") == "Cersei Lannister, Queen of the Andals and the First Men, Protector of the Seven Kingdoms."