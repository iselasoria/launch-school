=begin 
* DONE 13m48s
Create a method called "power" that takes two integers and returns the value of the first argument raised to the power of the second. Return nil if the second argument is negative.

Note: The ** operator has been disabled.

Examples:

power(2, 3) # 8
power(10, 0) # 1
power(-5, 3) # -125
power(-4, 2) # 16

I: two integers 
O: integer or nil 

Rules:
- return nil if the second argument is negative 
- raise the first to the ppower odf the second 

Examples:

(2,3)
2 to the power of 3 

DS:
integer

Algorithm:
- return nil if power_num is negative 
- make a copy of base and store in og_base 

- init running_value to 0
iterate as many times as the power_num
  - each time 
    - multiply first arg with itself and dump into running_value
    - reasgin base to the running_value
return running_value
=end 
def power(base, power_num)
  return nil if power_num < 1
  return nil if power_num == 0 
  og_base = base.dup 

  running_value = 0
  times = 0

  power_num.times do |_|
    res =  base * og_base 
    # puts "Res is now: #{res}"
    running_value += res
    times += 1
    base = running_value
    return res if times == power_num - 1
  end

end

p power(2, 3)== 8
p power(10, 0) == 1
p power(-5, 3) == -125
p power(-4, 2) == 16
p power(2, 3) == 8
p power(3, 2) == 9
p power(-5, 3) == -125
p power(-4, 2) == 16
p power(8, -2) == nil
