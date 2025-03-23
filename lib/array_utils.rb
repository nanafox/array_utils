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
end
