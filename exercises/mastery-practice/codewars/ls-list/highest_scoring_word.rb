def high(str)
  alphabet = ('a'..'z').zip(1..26).to_h

  word_sums = {}
  str.split do |word| # man 
    val = []
    word.chars.each do |letter| # m a n 
      val << alphabet[letter]
    end
    # p val 
    word_sums[word] = val.sum
  end


  word_sums.max_by {|word, val| val}[0]

end