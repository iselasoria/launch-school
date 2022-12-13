`multiple assignment` is when you assign more than one value on the same line. When an array is assigned to two variables on the same line, each element of that array gets assigned to one of the variables. 
```
odd, even = [1, 2, 3].partition do |num|
              num.odd?
            end
```


## Array#slice 

`arr = [1, 'two', :three, '4']`

`arr.slice(3, 1) # => ["4"]` <-- returns "4" inside an array object because we passed in a start index and a range

`arr.slice(3..3) # => ["4"]` <-- returns "4" inside an array object because we passed in a starting index and a range

`arr.slice(3)    # => "4"` <-- when we dont pass in a range, the `Array#slice` method will return just the element itself, in this case the string `"4"`

## Element Reference Gotchas

### Out of Bounds Gotchas
Referencing an array element that is out of bounds will return `nil` so be aware of that
especially problematic in the case of arrays since an array can contain all kinds of object
including `nil`

`Array#fetch` is the best method to prevent trying to retrieve an element out of bounds. It will throw an error
```
arr = [3, 'd', nil]
arr[2] # => nil
arr[3] # => nil
```
When using `Array#fetch`:
```
arr.fetch(2) # => nil
arr.fetch(3) # => IndexError: index 3 outside of array bounds: -3...3
             #        from (irb):3:in `fetch'
             #        from (irb):3
             #        from /usr/bin/irb:11:in `<main>'
```

## Negative Indices
The last element in an array or a string can be accessed by referencing index `-1`. The negative index starts at `-1` and works backwards

```
[ ][ ][ ][ ][ ]
 0  1  2  3  4
-5 -4 -3 -2 -1
```

## Element Assignment
This is a destructive action, so the original object is modified
```
arr = [1, 2, 3, 4, 5]
arr[0] += 1 # => 2
arr         # => [2, 2, 3, 4, 5]
```
**_Note_** this is a destructive method and it will modify the original array permanently

## Enumerable Methods
Methods that make up the `Enumerable` class are available to the `Array` class too.

One example, as shown in the `sp-easy-2/sum_or_product` exercise, `Enumerable#inject` can be used as a more rubyist way of computing sums and products. 

This method can take a block and perform the given operation for every item in the array. 

For example:
```
sum = (1..input_integer).inject {|sum, number| sum + number}

or

um = (1..input_integer).inject {|product, number| product + number}
```

This takes an array, as given by the range (as specified by `(1..upper_limit)`) and maps out an operation to perform in this case either sum or product. Then it sets `number` as the variable belonging to each element in the array and performs the specified operation.

---

_question_

`Help with Kernel#tap:`Can someone explain like I’m five how the `Kernel#tap` method is best used? As I understand it, it is meant to be good for outputting side effects in a method chain, or intermediate steps. But how does it differ from simply using `puts` to output such things? I can’t remember where in RB101 I encountered it but it seems that this probably makes most sense after OOP. Can someone in 101 understand it, or am I best off putting it on the back-burner till I reach OOP? Thank you!

_reply_

`#tap` is best thought of as primarily a debugging aid. If you need to print out the return value of a method that you're debugging, for instance, without altering the actual return value, you can use `#tap`. It simply takes whatever object is used to invoke `#tap`, passes that object to the block, and then returns that object.Thus, for instance:
```
def get_rand_int
   (100 * rand).to_i
end

n = get_rand_int
```

is a method that returns an integer between 0 and 99 (there's actually an easier way to do that, but for illustration purposes, I'll do it this way.If I want to both view the return value and use the result, I can `tap` the return value:
```
def get_rand_int
   (100 * rand).to_i.tap { |int| puts int }
end

n = get_rand_int
```

The function still works exactly as before, except that it now prints the result as well.You could do the samething without #tap, but you sometimes end up having to rewrite some of your code:
```
def get_rand_int
   result = (100 * rand).to_i
   puts result
   result
end
```

It's really easy to make mistakes if you do it this way.I hope that helps.

![:dart:](https://a.slack-edge.com/production-standard-emoji-assets/14.0/apple-small/1f3af.png)1![:+1:](https://a.slack-edge.com/production-standard-emoji-assets/14.0/apple-small/1f44d.png)1

![](https://ca.slack-edge.com/T0YKP5Z9T-U01E49NK7QX-3eada8469c78-48)

Rosa Isela Soria (RB109)  [2 months ago](https://launchschool.slack.com/archives/C020RV5PWG4/p1665567553494519?thread_ts=1665562089.056899&cid=C020RV5PWG4) 

_my reply_

Ah I see, thank you Pete! So it’s just a way of looking under the hood of method chains without having to have variables that we initialize _just_ for the purpose of printing them. And because we fiddle less with the code in an effort to print these middle steps, we don’t run the risk of unintentionally altering the return values.

_reply_

Right. I'm sure there probably are other cases where `#tap` might be useful, but I think debugging assistance is the primary use.

![](https://ca.slack-edge.com/T0YKP5Z9T-U01E49NK7QX-3eada8469c78-48)

Rosa Isela Soria (RB109)  [2 months ago](https://launchschool.slack.com/archives/C020RV5PWG4/p1665584967308099?thread_ts=1665562089.056899&cid=C020RV5PWG4)  

Thank you Pete!