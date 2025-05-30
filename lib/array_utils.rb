# frozen_string_literal: true

class Array
  alias_method :original_set, :[]=

  def []=(index_or_range, length = nil, value)
    if length.nil?
      if index_or_range.is_a?(Integer) && index_or_range >= size
        push(value)
      elsif index_or_range.is_a?(Range)
        original_set(index_or_range, value) # Handle range assignment
      else
        original_set(index_or_range, value)
      end
    else
      original_set(index_or_range, length, value) # Handle slice assignment
    end
  end

  # Partitions an array of integers based on parity (odd or even property)
  #
  # @return [Array] An nested array of odd and even numbers.
  def split_by_parity
    raise TypeError, "Expected only numbers" unless all?(Numeric)

    partition(&:odd?)
  end

  # Determines whether an array is "sparse," meaning it contains a significant
  # proportion
  # of `nil` values compared to its size.
  #
  # @param threshold [Float] The threshold ratio (default: 0.5).
  #   If the proportion of `nil` values to the array's size exceeds this
  #   threshold, the array is considered sparse.
  #
  # @return [Boolean] `true` if the array is sparse, `false` otherwise.
  #
  # @example Basic usage:
  #   [1, nil, nil, 4, nil].sparse? # => true (more than 50% nil values)
  #
  # @example Custom threshold:
  #   [1, nil, nil, 4, 5].sparse?(0.8) # => false (less than 80% nil values)
  #
  # @example Non-sparse array:
  #   [1, 2, 3, 4, 5].sparse? # => false (no nil values)
  def sparse?(threshold = 0.5)
    flatten.count(nil).to_f / flatten.size > threshold
  end

  # Returns a new array where all `nil` values are removed.
  #
  # If an element is an array, it is compacted (removing `nil` values)
  # before being added. This makes it more effective than the default `#compact`
  # method which only works with 1D arrays.
  #
  # @return [Array] A new array with `nil` values removed.
  def densify
    densified_array = []

    each do |elem|
      next unless elem

      if elem.is_a? Array
        nested = elem.densify
        # skip empty arrays after removing nil values
        densified_array << nested unless nested.empty?
      else
        densified_array << elem
      end
    end

    densified_array
  end

  # Modifies the array in place by removing all `nil` values.
  #
  # If an element is an array, it is compacted (removing `nil` values)
  # before being added. This makes it more effective than the default `#compact`
  # method which only works with 1D arrays.
  #
  # @return [self] The modified array.
  def densify!
    replace(densify)
  end
end
