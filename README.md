# array_utils

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
