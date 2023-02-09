=begin

https://leetcode.com/problems/find-nearest-point-that-has-the-same-x-or-y-coordinate/

1779. Find Nearest Point That Has the Same X or Y Coordinate
Easy
684
140
Companies
You are given two integers, x and y, which represent your current location on a Cartesian grid: (x, y). You are also given an array points where each points[i] = [ai, bi] represents that a point exists at (ai, bi). A point is valid if it shares the same x-coordinate or the same y-coordinate as your location.

Return the index (0-indexed) of the valid point with the smallest Manhattan distance from your current location. If there are multiple, return the valid point with the smallest index. If there are no valid points, return -1.

The Manhattan distance between two points (x1, y1) and (x2, y2) is abs(x1 - x2) + abs(y1 - y2).


Example 1:

Input: x = 3, y = 4, points = [[1,2],[3,1],[2,4],[2,3],[4,4]]
Output: 2
Explanation: Of all the points, only [3,1], [2,4] and [4,4] are valid. Of the valid points, [2,4] and [4,4] have the smallest Manhattan distance from your current location, with a distance of 1. [2,4] has the smallest index, so return 2.
Example 2:

Input: x = 3, y = 4, points = [[3,4]]
Output: 0
Explanation: The answer is allowed to be on the same location as your current location.
Example 3:

Input: x = 3, y = 4, points = [[2,3]]
Output: -1
Explanation: There are no valid points.

I: two integers and an array 
O: integer 

Rules:
- the two integers 
- the array is the list of points to choose from 
- a point is valid if:
  - it's NOT the same as my current location 
  - it shares x coordinate
  - it shares y coordinate 
- of the valid points, we're only interested in the one with the smallest Manhattan distance given by:
  (x1-x2).abs + (y1-y2).abs


Examples:
ints: 3, 4 ---> x = 3, y = 4
pts: [1, 2,], [3, 1], [2, 4], [2, 3], [4,4]
* in the array, we want [3,1], [2,4], [4,4]
* compare distance to your position
  (3-3).abs + (4-1).abs --> 3 ---> discard this one, we want shortest distance!
  (3-2).abs + (4-4).abs --> 1 
  (3-4).abs + (4-4).abs --> 1
* [2,4], [4,4]
* retrieve the index of the first valid point above, from the original input array 
return: 2 (index 2 in input array)

Data Structures:
I: array, integers 
Interim: arrays, hash 
O: integer 

Algorithm:
- `location` is (x,y) from input integers 
- compare `location` to each element in the array --> iteration
  - only care about items in the array of they have the same x, or the same y--> selection 
- transform point to the Manhattan distance --> iteration
  - zip the location to each item in the array 
  - (x1-x2).abs + (y1-y2).abs 
- select the smallest distance from the above transformation 
- retrieve the index from the input array that matches the point ex) input_arr.index[smallest_pt]

- edge cases to handle:
  - when location is the same as the input_arr, return the index which is 0 
  - when the valid points array is empty, then return -1 


=end

def nearest_valid_point(x, y, points)
  location = [x,y]
  return 0 if points == location

  valid_points = points.select do |pt|
                  pt[0] == location[0] || pt[1] == location[1]
                end
                
  return -1 if valid_points.empty?
  zipped = valid_points.map do |vp|
            location.zip(vp)
          end


  winner = zipped.min_by do |zipped_xy|
            zipped_xy[0].inject(:-).abs + zipped_xy[1].inject(:-).abs
          end
  points.index(winner.map {|pair| pair[1]})

end

def nearest_valid_point(x, y, points)
  select_subarray = points.select { |subarray| subarray[0] == x || subarray[1] == y }.min_by { |subarray| (x - subarray[0]).abs + (y - subarray[1]).abs }
  return -1 if select_subarray.nil?
  points.index(select_subarray)
end

# p nearest_valid_point(3, 4, [[3, 4]]) == 0
# p nearest_valid_point(3, 4, [[2, 3]]) == -1
p nearest_valid_point(3, 4, [[1, 2], [3, 1], [2, 4], [2, 3], [4, 4]]) == 2