=begin
You have a bank of switches before you, numbered from 1 to n. Each switch is connected to exactly one light that is initially off. 
You walk down the row of switches and toggle every one of them. You go back to the beginning, and on this second pass, you toggle switches 
2, 4, 6, and so on. On the third pass, you go back again to the beginning and toggle switches 3, 6, 9, and so on. 
You repeat this process and keep going until you have been through n repetitions.

Write a method that takes one argument, the total number of switches, and returns an Array that identifies which lights are on after n repetitions.

Example with n = 5 lights:

round 1: every light is turned on
round 2: lights 2 and 4 are now off; 1, 3, 5 are on
round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
round 4: lights 2 and 3 are now off; 1, 4, and 5 are on
round 5: lights 2, 3, and 5 are now off; 1 and 4 are on
The result is that 2 lights are left on, lights 1 and 4. The return value is [1, 4].

With 10 lights, 3 lights are left on: lights 1, 4, and 9. The return value is [1, 4, 9].

Input: integer 
Output: array 

Goal: to find out which lights are on after n repetitions

Rules:
- round 1-- toggle all of them on 
- round 2-- toggle 2,4,6,8 etc
- round 3-- toggle 3,6, 9 etc
- round 4-- toggle 4,8,12 etc 


Examples / Model Solution
When input = 5
s - - - - -     all are off
1 * * * * *     all are on
2 * - * - *     change multiples of 2
3 * - - - *     change multiples of 3
4 * - - * *     change multiples of 4
5 * - - * -     change multiples of 5

only [1, 4] are on


Data: 

Data Points to Capture:
- position of the lights 

Data Structures:
- hash 


Algorithmn:
Helper Method: Build Hash(int)
- initialize a hash `lights` with position as key and status on(true)/off(false) as values as far as n input requests

Main Method: mil_luces(int)
- iterate over the lights hash
  - with each iteration if the key is a multiple of the iteration,
    - toggle 
return lights values that are true

=end




def build_lights(n)
  lights = {}

  (1..n).each do |num|
    lights[num] = false
  end
  lights
end

def mil_luces(int)
  lights = build_lights(int)
  places = [1, 2, 3, 4, 5]

  places.each do |position|
    lights.each do |(light_spot, light_on)|
      # puts "POSITION IS #{position} and light spot is #{light_spot} the light is #{light_on}"
      if light_spot % position == 0 
        lights[light_spot] = !light_on
      end
    end
  end
  results = []
  lights.each do |pos, light|
    if light == true
      results << pos
    end
  end
    results
end

p mil_luces(5)
