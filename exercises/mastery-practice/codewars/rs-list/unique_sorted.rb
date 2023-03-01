# TODO

arr = [3,5,7,1,6,10,12]
def sortme(arr)
  
  even, odd = arr.partition{|item| item.even?}

  # replace odds
  arr.replace{|item| item.odd? }
  odd_idx = 
  even = even.sort.reverse.fill('X', even.size...arr.size)


  odd.sort.each do |num, idx|
    # insert at the index 
    even.insert(,num)
  end
  even
end

p sortme(arr)