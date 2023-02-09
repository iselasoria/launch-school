=begin 
There are n people in a line queuing to buy tickets, where the 0th person is at the front of the line and the (n - 1)th person is at the back of the line.

You are given a 0-indexed integer array tickets of length n where the number of tickets that the ith person would like to buy is tickets[i].

Each person takes exactly 1 second to buy a ticket. A person can only buy 1 ticket at a time and has to go back to the end of the line (which happens instantaneously) in order to buy more tickets. If a person does not have any tickets left to buy, the person will leave the line.

Return the time taken for the person at position k (0-indexed) to finish buying tickets.

Input: tickets = [2,3,2], k = 2
Output: 6
Explanation: 
- In the first pass, everyone in the line buys a ticket and the line becomes [1, 2, 1].
- In the second pass, everyone in the line buys a ticket and the line becomes [0, 1, 0].
The person at position 2 has successfully bought 2 tickets and it took 3 + 3 = 6 seconds.

Input: tickets = [5,1,1,1], k = 0
Output: 8
Explanation:
- In the first pass, everyone in the line buys a ticket and the line becomes [4, 0, 0, 0].
- In the next 4 passes, only the person in position 0 is buying tickets.
The person at position 0 has successfully bought 5 tickets and it took 4 + 1 + 1 + 1 + 1 = 8 seconds.

I: array of integers 
O: integer 

Rules:
- second argument is spot_in_line 
- first argument is tickets_to_buy 
- with each pass, every single element in the array is reduced by 1 
- each iteration of the array is one second 
- numbers in the array are the number of tickets the person needs to buy 
- iteration stops when array[k] is 0 

Examples:
          [2,3,2] and person at position 2
first run:[1,2,1] 
second run: [0,1,0]

Data Structures:
I: array and integer 
Interim: array 
O: integer 

Algorithm:
- initialize `time` variable to hold time spent starts at 0, acts like an index to outer loop
- initialize outer for loop that stops at the number of tickets k person wants to buy
- itearte over the tickets array 
  - reduce current element by 1 
  - break when array[k] is 0 

=end 

def time_required_to_buy(tickets, spot)
  return tickets.sum if spot == 0 
  time = 0

  for purchase in (1..tickets[spot])

    run_log = tickets.map! do |tix|
            time += 1 if tix > 0
            p run_log#tickets[spot]
            tickets[spot] == 0 ? break : tix -= 1
            # tix -= 1 # when someone buys a ticket 
            
            
          end 
    # p run_log

 
  end 
  time 
end 

def time_required_to_buy(tickets, k)
  time_count = 0
  until tickets[k] == 0
    new = []

    tickets.each do |ticket|
      if ticket == 0
        new << 0
        next 
      end 

      new << ticket -= 1
      if new[k] == 0
        break 
      else 
      time_count += 1 
      end
    end 

    tickets = new
     p new
  end  
  time_count + 1
end

# p time_required_to_buy([2,3,2], 2) == 6
# p time_required_to_buy([5,1,1,1], 0) == 8
p time_required_to_buy([84,49,5,24,70,77,87,8], 3) #== 154