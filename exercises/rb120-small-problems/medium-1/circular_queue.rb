=begin
A circular queue is  acollection of objects that is reated as if they were connected in a circle.
Adding an object:
  - An object is added to the position immediately following the most recently added object.
Removing an object:
  - Always removes the object that has been in the queue the longest (first added)

When the buffer becomes full, adding a new object means we have to delete an existing one-- the oldest.

Example: a circular queue with three available spots
| P1 | P2 | P2 |
+----+----+----+
|    |    |    | <-- starts all empty
|  1 |    |    | <-- add 1
|  1 | 2  |    | <-- add 2, now at this point we have 2 objects in the queue
|    | 2  |    | <-- remove oldest(1)
|    | 2  |  3 | <-- add 3
|  4 | 2  |  3 | <-- add 4 and now the queue is full
|  4 |    |  3 | <-- remove the oldest(2)
|  4 | 5  |  3 | <-- add 5, queue is full again
|  4 | 5  |  6 | <-- add 6, and replace oldest(3)
|  7 | 5  |  6 | <-- add 7, replaces olders(4)
|  7 |    |  6 | <-- remove oldest(5)
|  7 |    |    | <-- remove oldest(6)
|    |    |    | <-- remove oldest(7)
|    |    |    | <-- remove any non existent(nil)

#======================================================================================================#
Your task is to write a CircularQueue class that implements a circular queue for arbitrary objects.
The class should obtain the buffer size with an argument provided to CircularQueue::new,
and should provide the following methods:
- `enqueue` to add an object to the queue
- `dequeue` to remove (and return) the oldest object in the queue. It should return nil if the queue is empty.

You may assume that none of the values stored in the queue are nil
(however, nil may be used to designate empty spots in the buffer).
The code below should pring true 15 times.
=end

class CircularQueue
  def initialize(item)
  end
end

queue = CircularQueue.new(3)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

queue = CircularQueue.new(4)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 4
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil