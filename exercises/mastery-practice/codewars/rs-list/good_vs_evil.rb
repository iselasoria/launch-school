def good_vs_evil(good, evil)
  # good.gsub!(' ', ',')
  # evil.gsub!(' ', ',')
  # p good
  # p evil
  good_arr = good.split(//).map(&:to_i).sum
  evil_arr = evil.chars.map(&:to_i).sum

  p good_arr.map(&:to_i)
  p good_arr
  p evil_arr
  result = good_arr - evil_arr 
  
  if result == 0
    return 'Battle Result: No victor on this battle field'
  elsif good > evil 
    return 'Battle Result: Good triumphs over Evil'
  elsif evil > good 
    return "Battle Result: Evil eradicates all trace of Good"
    end 
end

# p p good_vs_evil('1 0 0 0 0 0', '1 0 0 0 0 0 0') == 'Battle Result: No victor on this battle field'
# p good_vs_evil('0 0 0 0 0 10', '0 1 1 1 1 0 0') ==  'Battle Result: Good triumphs over Evil'
p good_vs_evil('0 0 0 0 0 10', '0 1 1 1 1 0 0') #== 'Battle Result: Good triumphs over Evil'