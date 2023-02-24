def solution(str, comment)
  words = str.split(/\n/)


  words.map do |word|
    if comment.any? { |c| word.include?(c) }
    word.chars.map do |ch|
      if comment.include?(ch)
        word[0...word.index(ch)]
      end
    end.compact!
  else 
    [word]
  end.join.strip

  end.join("\n")

end 