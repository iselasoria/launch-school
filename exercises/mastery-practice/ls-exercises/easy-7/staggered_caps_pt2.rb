=begin 
 TODO Interview Prep 
 
Modify the method from the previous exercise so it ignores non-alphabetic 
characters when determining whether it should uppercase or lowercase 
each letter. The non-alphabetic characters should still be included in the 
return value; they just don't count when toggling the desired case.
=end


def staggered_case(string)
  result = ''
  needs_cap = true
  string.chars.each do |char|
    if ('a'..'z').to_a.include?(char.downcase)
 
      if needs_cap 
        result += char.upcase
      else
        result += char.downcase 
      end
      needs_cap = !needs_cap
    else
      result += char
    end

    
  end
  result
end


# test cases 
p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'