# array_utils

[![Gem Version](https://badge.fury.io/rb/array_utils.svg)](https://badge.fury.io/rb/array_utils)

## About

A simple Ruby gem that handles the issue with Ruby's Array class when inserting
an element at an index greater than the current array size. It handles this by
intelligently appending the result to the end of the array instead of creating
a **sparse array**.

It also includes some other useful Array methods for common uses.

## Installation

Add this line to your Gemfile

```bash
gem "array_utils"
```

Or install directly

```bash
gem install array_utils
```

## Examples

### Without `array_utils`

```ruby
array = []
array[10] = 56
# => [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, 56]
```

### With `array_utils`

`array_utils` helps you avoid having a **sparse array** and wasting memory.

```ruby
require "array_utils"

array = []
array[10] = 56
# => [56] # Appends it to the end of the array
```

## Additional Methods

### `sparse?(threshold = 0.5)`

Determines if an array is sparse based on the given threshold.

```ruby
array = [nil, nil, 3, nil, 5, nil]
array.sparse?(0.4)  # => true
array.sparse?(0.8)  # => false

# it works with nested arrays as well (using default 50% threshold)
sparse_nested_array = [ [ 1, nil, nil, 4 ], [ 5, nil, nil, nil ] ]
sparse_nested_array.sparse?
# => true

normal_nested_array = [ [ 1, 2, 3, 4 ], [ 5, nil, 6, 7 ] ]
normal_nested_array.sparse?
# => false
```

### `densify`

Returns a new array where all `nil` values are removed, including from nested arrays.

```ruby
array = [1, nil, [2, nil, 3], nil, [nil, nil], 4]
array.densify
# => [1, [2, 3], 4]
```

### `densify!`

Modifies the array in place by removing all `nil` values, including from nested arrays.

```ruby
array = [1, nil, [2, nil, 3], nil, [nil, nil], 4]
array.densify!
array
# => [1, [2, 3], 4]
```
