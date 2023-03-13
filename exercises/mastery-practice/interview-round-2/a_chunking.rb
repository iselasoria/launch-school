# generate subs that are only vowels # DONE 02m40s
def gen_subs(str)
  subs = []
  (0...str.size).each do |st|
    (st...str.size).each do |nd|
      slice = str[st..nd]
      subs << slice if slice.chars.all? {|item| %w(a e i o u).include?(item)}
    end
  end
  subs 
end 
p gen_subs("onomatopeia")

# generate subs that are only consonants # DONE 01m49s
def gen_subs(str)
  subs = []
  (0...str.size).each do |st|
    (st...str.size).each do |nd|
      slice = str[st..nd]
      subs << slice if slice.chars.all? {|item| !%w(a e i o u).include?(item)}
    end 
  end
  subs 
end
p gen_subs("onomatopeia")

# generate pairs # DONE 02m50s

def gen_pairs(str)
  pairs = []

  (0...str.size).each do |i|
    (i + 1...str.size).each do |ii|
      slice = [str[i], str[ii]]
      pairs << slice 
    end
  end
  pairs.size
end
p gen_pairs("onomatopeia")

generate sliding slice 

# def gen_slide(str, ch_size) # 12m36s
  slide = []
  
  stepper = []
  0.step(to: str.size, by: ch_size) {|item| stepper << item}

  (0...str.size).each do |st|
    sliding_slice = str[st, ch_size]  
    slide << sliding_slice if stepper.include?(st)
  end
  slide
end

p gen_slide("onomatopeia", 4)


# generate subs that are contiguous in the alphabet 
def gen_subs(str) # DONE 07m11s
  subs = []
  (0...str.size).each do |st|
    (st...str.size).each do |nd|
      slice  = str[st..nd]
      proper_range = (slice[0].ord...(slice[0].ord + slice.size)).to_a 
      actual_range = slice.chars.map(&:ord)
      subs << slice if proper_range  == actual_range && slice.size > 1
    end  
  end 
  subs 
end

p gen_subs("studious")


# generate slice of a given size at each index 



####################

# check if a number is prime # DONE 2m30s

def is_prime?(num)
  return false if num <= 1
  (2...num).all? do |divisor|
    num % divisor != 0
  end
end

# p is_prime?(4)
# p is_prime?(5)

# get a list of all prime up to a certain number # DONE 1m40s
def get_all_primes_in_range(num)
  (2..num).select do |number|
    is_prime?(number)
  end
end

p get_all_primes_in_range(10)

# get the next n number of primes starting at a given number # DONE 1m50s

def next_n_primes(num, next_primes)
  primes_list = []
  starting_num = num
  loop do 
    primes_list << num if is_prime?(num)
    num += 1
    break if primes_list.size == next_primes
  end
  primes_list
end

p next_n_primes(1, 10)
