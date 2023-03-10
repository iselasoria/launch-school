=begin 
* DONE 21m48s
Carlos is a huge fan of something he calls smooth sentences.

A smooth sentence is one where the last letter of each word is identical to the first letter the following word (and not case sensitive, so "A" would be the same as "a").

The following would be a smooth sentence "Carlos swam masterfully" because "Carlos" ends with an "s" and swam begins with an "s" and swam ends with an "m" and masterfully begins with an "m".

Create a function that determines whether the input sentence is a smooth sentence, returning a boolean value true if it is, false if it is not.

Examples
is_smooth("Marta appreciated deep perpendicular right trapezoids") ➞ true
is_smooth("Someone is outside the doorway") ➞ false
is_smooth("She eats super righteously") ➞ true

Notes
    The last and first letters are case insensitive.
    There will be no punctuation in each sentence.

I: string 
O: boolean 

Rules:
- a smooth sentence:
  - last letter of current, and first letter of next are the same 
    - first and last items in the array, those only check last and first 
    - no pucntuation 
    - the case does not matter 
    "case"--> "Eraser"

Examples:
"Marta appreciated deep perpendicular right trapezoids"
 M.  a a         d d. p p           r r.  t t        s
  [m,a][a,d][d,p][p,r][r,t][t,s]
  [m,a][a,d][d,p][p,r][r,t][t,s]
  [m,a][a,d]
    [m,a]
    [d,a]
       [a,d][d,p]
          [a,d]
          [p,d]
            [d,p][p,r]
              [d,p]
              [r,p]
                  [p,r][r,t]
            
DS:
I: string 
interim: arrays of words 
O: boolean 

Algorithm:
- split into array of words 
- transform array of words into only first last chars `chain`

- take slices of the `chain` to make `links`
  - for every link 
    - zip first to second reverse store in `checker`
    - a link is chained if the two elements on the second index are the same 
      - continue on to next iterations 
    - if there is a broken link, return false 

- true 
=end 

def is_smooth(str)
  str.downcase!
  words = str.split  
  
  chain = words.map {|item| [item.chars.first, item.chars.last]}

  links = chain.each_cons(2).to_a

  links.each do |link|
    checker = link[0].zip(link[1].reverse)
    # p checker
    next if checker[1].uniq.size == 1
    return false 
  end
  true 
end

p is_smooth("Marta appreciated deep perpendicular right trapezoids") == true
p is_smooth("Someone is outside the doorway") == false
p is_smooth("She eats super righteously") == true
p is_smooth("Ben naps so often") == true
p is_smooth("Cute triangles are cute") == false
p is_smooth("Mad dislikes sharp pointy yoyos") == true
p is_smooth("Rita asks Sam mean numbered dilemmas") == true
p is_smooth("Marigold daffodils streaming happily.") == false
p is_smooth("Simply wonderful laughing.") == false