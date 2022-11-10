# Hashes Madness

## Basics
---
### Comparing if the hashes contain the same keys and numbers

- `h1 == h2`

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

## Enumerating

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