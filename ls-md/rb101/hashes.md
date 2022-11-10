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

### Setting the value of a key
`h[key] = value`

### Check if a hash contains no key value pairs
`h.empty?`

### Check the number of key value pairs
`h.length`

---
## Keys

### Delete key/value pair and return value from hash h whose key is equal to key
`h.delete(key)`

### Return true of the key given is present
`h.has_key?(key)`

### Return true if the given key is present in the hash
`h.include?(key)`

### Passing the value, returns its key
`h.key(value)`

### Return true if the given key is present in the hash
`h.key?(key)`

### Return a new array populated with the keys from the hash
`h.keys`

### Return true if a given key is present in the hash
`h.member?(key)`

---

## Values

###  
`h.default`

### 

---

## Enumerating I

### Delete every key/value pair in the hash for which the block evaluates true
`h.delete_if`

### iterating key/value pairs
`h.each`

### iterating keys
`h.each_key`

### iterating values
`h.each_value` 

### delete each key/value pair for which the block evaluates to false
`h.keep_if`

---
## Enumerating II

### returns true if the block ever returns true
`h.any?`

### call block once for each key/value pair
`h.each_pair`

### return a new hadh consisting of entries for which the block returns false
`h.reject `

### equivalent to `delete_if` but will return `nil` if no changes were made to the hash
`h.reject!`

### return a new hash for which the block returned true
`h.select`

### equivalent to `keep_if` but returns true if no changes were made to the hash 
`h.select!`
