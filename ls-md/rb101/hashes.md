# Hashes Madness

## Basics

### Comparing if the hashes contain the same keys and numbers

`h1 == h2`

```
h1 = {a: 'apple', b: 'bear', c: 'cat'}
h2 = {a: 'apple', b: 'bear', c: 'cat'}

h1 == h2 # => true
```

### Accessing a key
`h[key]`
```
irb(main):007:0> h = {'a' => 'apple', 'b' => 'bear', 'c' => 'cat'}
=> {"a"=>"apple", "b"=>"bear", "c"=>"cat"}
irb(main):008:0> h['b']
=> "bear"
```

### Setting the value of a key
`h[key] = value`
```
=> {"a"=>"apple", "b"=>"bear", "c"=>"cat"}
irb(main):012:0> h['b'] = 'bug'
=> "bug"
irb(main):013:0> h
=> {"a"=>"apple", "b"=>"bug", "c"=>"cat"}
```

### Check if a hash contains no key value pairs
`h.empty?`
```
=> {"a"=>"apple", "b"=>"bug", "c"=>"cat"}
irb(main):015:0> h.empty?
=> false
```

### Check the number of key value pairs
`h.length`
```
=> {"a"=>"apple", "b"=>"bug", "c"=>"cat"}
irb(main):017:0> h.length
=> 3
```

---
## Keys

### Delete key/value pair and return value from hash h whose key is equal to key
`h.delete(key)`
```
=> {"a"=>"apple", "b"=>"bug", "c"=>"cat"}
irb(main):020:0> h.delete('b')
=> "bug"
irb(main):021:0> h
=> {"a"=>"apple", "c"=>"cat"}
```

### Return true of the key given is present
`h.has_key?(key)`
```
=> {"a"=>"apple", "c"=>"cat"}
irb(main):023:0> h.has_key?('a')
=> true
irb(main):024:0> h.has_key?('p')
=> false
```

### Return true if the given key is present in the hash
`h.include?(key)`
```
=> {"a"=>"apple", "c"=>"cat"}
irb(main):026:0> h.include?('a')
=> true
irb(main):027:0> h.include?('j')
=> false
```

### Get's the key: Passing the value, returns its key
`h.key(value)`
```
=> {"a"=>"apple", "c"=>"cat"}
irb(main):029:0> h.key('apple')
=> "a"
```

### Return true if the given key is present in the hash
`h.key?(key)`
```
=> {"a"=>"apple", "c"=>"cat"}
irb(main):031:0> h.key?('a')
=> true
```


### Return a new array populated with the keys from the hash
`h.keys`
```
=> {"a"=>"apple", "c"=>"cat"}
irb(main):033:0> h.keys
=> ["a", "c"]
```
### Return true if a given key is present in the hash
`h.member?(key)`

```
=> {"a"=>"apple", "c"=>"cat"}
irb(main):035:0> h.member?('a')
=> true
irb(main):036:0> h.member?('k')
=> false
```

---

## Values

### Return true if the given value is present for some key in hash h (option1)
`h.has_value?`
```
=> {"a"=>"apple", "b"=>"bear", "c"=>"cat"}
irb(main):038:0> h.has_value?('cow')
=> false
irb(main):039:0> h.has_value?('cat')
=> true
```

### Return true if the given value is present for some key in hash h (option1)
`h.value?(value)`
```
=> {"a"=>"apple", "b"=>"bear", "c"=>"cat"}
irb(main):041:0> h.value?("bear")
=> true
irb(main):042:0> h.value?("bug")
=> false
```

### Return a new array populated with the values from a hash
`h.values`
```
=> {"a"=>"apple", "b"=>"bear", "c"=>"cat"}
irb(main):044:0> h.values
=> ["apple", "bear", "cat"]
```

### Return an array containing the values associated with the given keys of a hash
`h.values_at(key1, key2)`
```
=> {"a"=>"apple", "b"=>"bear", "c"=>"cat"}
irb(main):046:0> h.values_at("a","b")
=> ["apple", "bear"]
irb(main):047:0> h.values_at("a","c")
=> ["apple", "cat"]
```

---

## Enumerating I

### Delete every key/value pair in the hash for which the block evaluates true
`h.delete_if`
```
=> {"a"=>"apple", "b"=>"bear", "c"=>"cat"}
irb(main):049:0> h.delete_if {|initial, animal| animal.size > 3}
=> {"c"=>"cat"}
irb(main):050:0> h
=> {"c"=>"cat"}
```

### iterating key/value pairs
`h.each`
```
irb(main):055:0> h.each {|k, v| p k, v}
"a"
"apple"
"b"
"bear"
"c"
"cat"
=> {"a"=>"apple", "b"=>"bear", "c"=>"cat"}
```

### iterating keys
`h.each_key`
```
irb(main):059:0> h.each_key {|key| puts key}
a
b
c
=> {"a"=>"apple", "b"=>"bear", "c"=>"cat"}
```

### iterating values
`h.each_value` 
```
=> {"a"=>"apple", "b"=>"bear", "c"=>"cat"}
irb(main):061:0> h.each_value {|value| puts value}
apple
bear
cat
=> {"a"=>"apple", "b"=>"bear", "c"=>"cat"}
```

### Delete each key/value pair for which the block evaluates to false
`h.keep_if`
```
irb(main):062:0> h
=> {"a"=>"apple", "b"=>"bear", "c"=>"cat"}
irb(main):063:0> h.object_id
=> 70305939201600
irb(main):064:0> h.keep_if {|k, v| v.start_with?('c')}
=> {"c"=>"cat"}
irb(main):065:0> h
=> {"c"=>"cat"}
irb(main):066:0> h.object_id
=> 70305939201600
```

---
## Enumerating II

### returns true if the block ever returns true
When we pass an argument, key/value must be the exact for it to return true

`h.any?`

```
When we pass a block:
=> {"a"=>"apple", "b"=>"bear", "c"=>"cat"}
irb(main):071:0> h.any? {|k, v| v.start_with?('z')}
=> false
irb(main):072:0> h.any? {|k, v| v.start_with?('a')}
=> true

When given an argument: 
=> {"a"=>"apple", "b"=>"bear", "c"=>"cat"}
irb(main):074:0> h.any?(['a', 'apple'])
=> true

=> {"a"=>"apple", "b"=>"bear", "c"=>"cat"}
irb(main):074:0> h.any?(['a', 'apple'])
=> true
irb(main):075:0> h.any?(['a', 'amigo'])
=> false
```


### call block once for each key/value pair
`h.each_pair`
```
=> {"a"=>"apple", "b"=>"bear", "c"=>"cat"}
irb(main):077:0> h.each_pair {|k, v| puts "key: #{k} and value #{v}"}
key: a and value apple
key: b and value bear
key: c and value cat
=> {"a"=>"apple", "b"=>"bear", "c"=>"cat"}
```


### return a new hash consisting of entries for which the block returns false
`h.reject `
```
=> {"a"=>"apple", "b"=>"bear", "c"=>"cat"}
irb(main):081:0> h.reject {|k,v| v.start_with?('b')}
=> {"a"=>"apple", "c"=>"cat"}
```


### equivalent to `delete_if` but will return `nil` if no changes were made to the hash
`h.reject!`
```
=> {"a"=>"apple", "b"=>"bear", "c"=>"cat"}
irb(main):085:0> h.reject! {|k,v| v.start_with?('b')}
=> {"a"=>"apple", "c"=>"cat"}
irb(main):086:0> h
=> {"a"=>"apple", "c"=>"cat"}
```
### return a new hash for which the block returned true
`h.select`
```
=> {"a"=>"apple", "b"=>"bear", "c"=>"cat"}
irb(main):090:0> h.select {|k,v| k == 'a'}
=> {"a"=>"apple"}
```

### equivalent to `keep_if` but returns true if no changes were made to the hash 
`h.select!`
```
=> {"a"=>"apple", "b"=>"bear", "c"=>"cat"}
irb(main):100:0> h.object_id
=> 70305943092020
irb(main):101:0> h.select! {|k,v| k == 'c'}
=> {"c"=>"cat"}
irb(main):102:0> h.object_id
=> 70305943092020
```

---

## General I

### Check if two hashes are equal
`h1.eql?(h2)`
```
irb(main):112:0> h1
=> {"a"=>"apple", "b"=>"bear", "c"=>"cat"}
irb(main):113:0> h2
=> {"a"=>"apple", "b"=>"bear", "c"=>"cat"}
irb(main):114:0> h1.eql?(h2)
=> true
```

### Return a new array that is one-dimensional flattening of hash h
`h.flatten`
```irb(main):115:0> h1
=> {"a"=>"apple", "b"=>"bear", "c"=>"cat"}
irb(main):116:0> h1.flatten
=> ["a", "apple", "b", "bear", "c", "cat"]
irb(main):117:0> h1
=> {"a"=>"apple", "b"=>"bear", "c"=>"cat"}
```

### return a new hash created by using the original hash's values as keys, and the keys as values
`h.invert`
```
irb(main):118:0> h1
=> {"a"=>"apple", "b"=>"bear", "c"=>"cat"}
irb(main):119:0> h1.invert
=> {"apple"=>"a", "bear"=>"b", "cat"=>"c"}
```

### Return a new hash containing the contents of h1 and h2 (can use block to solve conflicts)
`h1.merge(h2)`
```
irb(main):126:0> h1
=> {"a"=>"apple", "b"=>"bear", "c"=>"cat"}
irb(main):127:0> h2
=> {"d"=>"dog", "p"=>"pato", "t"=>"toro"}
irb(main):128:0> h1.merge(h2)
=> {"a"=>"apple", "b"=>"bear", "c"=>"cat", "d"=>"dog", "p"=>"pato", "t"=>"toro"}
```

### Remove a key/value pair from hash h and return it as the two item array `[key,value]`
`h.shift`

### Return the number of key value pairs
`h.size`

### Convert hash to a nested array of `[key, value]`
`h.to_a`

---

## General II

### Make hash h compare its keys by identity (exact same objects)
`h.compare_by_identity`
