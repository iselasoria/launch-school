#TODO Trisha attempted this, need to try














################
def solve(num, rem)
  arr = num.to_s.chars.map(&:to_i)
  subs = []
  (0...arr.size).each do |starting|
    (starting...arr.size).each do |ending|
      slice = arr[starting..ending]
      subs << slice.join.to_i
    end
  end
  subs.select do |item| 
    p item
    p num.digits.size - rem
  item.digits.size == num.digits.size - rem
  end
end

p solve(123056,2)


#####

   # 123056, 1 --> 1056
   # my added backwards and fowards is not allowed to be bigger than input number length - rem.length 
   # max length 5!!!!

   # num 1 
   # backwards length 0 
   # forward legnth 5 
   # num 2 
   # backward legnth 1
   # forward length 4 
   def solve(num, rem)
    arr = num.to_s.chars.map(&:to_i)
    max_size = arr.size - rem
    subs = []
    (0...arr.size).each do |starting|
      (starting...arr.size).each do |ending|
        b_slice = arr[starting...ending]
        p b_slice
        f_slice = arr[ending + 1..-1]
        if b_slice.size + f_slice.size == arr.size - rem
          subs << [b_slice, f_slice]
        end
      end
    end
  
    subs.map! {|item| (item[0] + item[1])}
  
    subs.map! {|chunk| chunk.map(&:to_s).join }.min
  end
    
  
  # p solve(123056,1) =='12056'
  # p solve(123056,3) =='056'
  # p solve(123056,4) =='05'
  # p solve(1284569,1) =='124569'
  p solve(123056,2) #=='1056'
  # p solve(1284569,2) =='12456'
  # p solve(1284569,3) =='1245'
  # p solve(1284569,4) =='124'
  
  #####


   # 123056, 1 --> 1056
   # my added backwards and fowards is not allowed to be bigger than input number length - rem.length 
   # max length 5!!!!

   # num 1 
   # backwards length 0 
   # forward legnth 5 
   # num 2 
   # backward legnth 1
   # forward length 4 
def gen_subs(num, rem)
  arr = num.to_s.chars.map(&:to_i)
  max_size = arr.size - rem
  left_slices = []
  right_slices = []
  (0...arr.size).each do |starting|
    (starting...arr.size).each do |ending|
      l_slice = arr[starting..ending]
      r_slice = arr[ending + 1..-1]
      left_slices << l_slice
      right_slices << r_slice
      # puts "Left: #{l_slice} and right: #{r_slice}"

      # b_slice = arr[starting...ending]
      # p b_slice
      # f_slice = arr[ending + 1..-1]
      # if b_slice.size + f_slice.size == arr.size - rem
      #   subs << [b_slice, f_slice]
      # end
    end
  end
  combo = left_slices.product(right_slices)

  
end

def solve(arr, rem)
  max_size = arr.digits.size - rem
  subs = gen_subs(arr, rem)
  subs.sort.each do |i|
    p i 
  end 
  subs.select! {|item| item[0].size + item[1].size == max_size}
  
  subs.map(&:join)
 

  # subs.map! {|item| (item[0] + item[1])}

  # subs.map! {|chunk| chunk.map(&:to_s).join }.min
end


# p solve(123056,3) =='056'
# p solve(123056,4) =='05'
# p solve(1284569,1) =='124569'

# working on:
# p solve(123056,2) #=='1056'
# p solve(123056,1) #=='12056'
# p solve(1284569,2) #=='12456'
# p solve(1284569,3) #=='1245'
p solve(1284569,4) #=='124'


  