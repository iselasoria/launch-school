# Loop Control

## Break Placement
In this example below, the placement of the loop allows this loop to behave like a `do/while` loop. `do/while` loops are guaranteed to run at least once. 

```
counter = 0

loop do
  puts 'Hello!'
  counter += 1
  break if counter == 5
end
```

However, if we had the break condition at the beginning and the condition was met at the first tieration, this would no longer behave like a `do/while` loop. The code in this loop would never get executed:
```
counter = 0

loop do
  break if counter == 0
  puts 'Hello!'
  counter += 1
end
```