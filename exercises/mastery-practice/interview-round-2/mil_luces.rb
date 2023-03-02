=begin
* DONE 24m24s
You have a bank of switches before you, numbered from 1 to n. Each switch is connected to exactly one light that is initially off. You walk down the row of switches and toggle every one of them. You go back to the beginning, and on this second pass, you toggle switches 2, 4, 6, and so on. On the third pass, you go back again to the beginning and toggle switches 3, 6, 9, and so on. You repeat this process and keep going until you have been through n repetitions.

Write a method that takes one argument, the total number of switches, and returns an Array that identifies which lights are on after n repetitions.

Example with n = 5 lights:

round 1: every light is turned on
round 2: lights 2 and 4 are now off; 1, 3, 5 are on
round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
round 4: lights 2 and 3 are now off; 1, 4, and 5 are on
round 5: lights 2, 3, and 5 are now off; 1 and 4 are on
The result is that 2 lights are left on, lights 1 and 4. The return value is [1, 4].

With 10 lights, 3 lights are left on: lights 1, 4, and 9. The return value is [1, 4, 9].


I: integer 
O: array 

Rules:
  - there are n number of lights 
  - all lights are off to start 
  - there are as many rounds as there are lights
    - on the first pass, toggle all 
    - the second, toggle 2, 4,6...
    - on the third, toggle 3,6,9 
  - identify the lights that are still on after n rounds 

Examples:
input: 5 
      
        12345
        -----
round1  *****
round2  *-*-*
round3  *---*
round4  *--**
round5  *--*-

lights on: [1,4] not zero based 


DS:
arrays and hashes 

Algorithm:
Helper Method: light_position(n)
- init a hash of position_and_light --> position of the light, and current state all off to start 
  --> on == true and off == false 

Main Method: thousand_lights(n)
- iterate over a range of 1 up to n # rounds 
  - with each round
    - check if the current round is a mltiple of the hash position ****
      - toggle the status of the light 

  - select the values (positions) of currently on 

=end 

def light_position(n)
  (1..n).to_a.each_with_object({}) do |num, hash|
    hash[num] = false
  end
end

def thousand_lights(n)
  lights = light_position(n)

  (1..n).each do |round|
    lights.keys.each do |position|
      if position % round == 0 # multiple
        lights[position] = !lights[position]
      end
    end
  end

  lights.select {|_, status| status == true}.keys
end
p thousand_lights(5) == [1,4]
p thousand_lights(9) == [1, 4, 9]
