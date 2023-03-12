=begin 
* DONE 36m19s
Your computer might have been infected by a virus! Create a function that finds the viruses in files and removes them from your computer.

Examples
remove_virus("PC Files: spotifysetup.exe, virus.exe, dog.jpg") ➞ "PC Files: spotifysetup.exe, dog.jpg"

remove_virus("PC Files: antivirus.exe, cat.pdf, lethalmalware.exe, dangerousvirus.exe ") ➞ "PC Files: antivirus.exe, cat.pdf"

remove_virus("PC Files: notvirus.exe, funnycat.gif") ➞ "PC Files: notvirus.exe, funnycat.gif")

Notes

    Bad files will contain "virus" or "malware", but "antivirus" and "notvirus" will not be viruses.
    Return "PC Files: Empty" if there are no files left on the computer.

I: string 
O: string 

Rules:
  - malicious files: 
    - virus or malware 
  - safe files 
    - "antivirus" or "notvirus"
  - return "PC FIles: Empty" if nothing is left on the PC 

Examples:
"PC Files: spotifysetup.exe, virus.exe, dog.jpg") == "PC Files: spotifysetup.exe, dog.jpg"

"PC Files: antivirus.exe, cat.pdf, lethalmalware.exe, dangerousvirus.exe ") == "PC Files: antivirus.exe, cat.pdf"

"PC Files: notvirus.exe, funnycat.gif") ==  "PC Files: notvirus.exe, funnycat.gif"

"PC Files: virus.exe, bestmalware.exe, memzvirus.exe") ==  "PC Files: Empty"

DS:
- string (comma delimited string)
- string (comma delimited)

Algorithm:
- split by comma into an array of `files` and dupe 

- init two constants `SAFE_FILES` and  `MALICIOUS_FILES` to contain keywords to look out for 

- iterate over the files array 
  - if the file contains a keyword thar is malicious then delete from the dupe 

return PC status of files 
=end 
def remove_virus(str)
  files = str.split(/,/)
  files_dupe = files.dup

  safe_files = ["antivirus", "notvirus"]
  malicious_files = ["malware", "virus"]

  files.map do |file|
    malicious_files.each do |item|
      if file.include?(item)
        files_dupe.delete(file) unless file.include?("anti") || file.include?("not")
        end
    end 
  end
  res = files_dupe.join(',')
  if res.empty? 
    "PC Files: Empty"
  else
    res
  end
end

p remove_virus("PC Files: spotifysetup.exe, virus.exe, dog.jpg, malware.pdf") #== "PC Files: spotifysetup.exe, dog.jpg"
p remove_virus("PC Files: antivirus.exe, cat.pdf, lethalmalware.exe, dangerousvirus.exe ") #== "PC Files: antivirus.exe, cat.pdf"
p remove_virus("PC Files: notvirus.exe, funnycat.gif") #==  "PC Files: notvirus.exe, funnycat.gif"
p remove_virus("PC Files: virus.exe, bestmalware.exe, memzvirus.exe") #==  "PC Files: Empty"