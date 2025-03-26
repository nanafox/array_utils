require "minitest/autorun"
require "minitest/spec"
require "array_utils"

describe "ArrayUtils#[]=" do
  before do
    @array = [ 1, 2, 3 ]
  end

  describe "when a large number is given as index" do
    it "should append at the end of the array" do
      initial_size = @array.size

      @array[1200] = 56

      assert_equal @array.size, initial_size + 1
      assert_equal @array.last, 56
    end
  end

  describe "when an invalid negative number is passed as index" do
    it "should throw an IndexError exception" do
      assert_raises(IndexError) { @array[-100] = 56 }
    end
  end

  it "handles range updates as well" do
    numbers = [ 1, 2, 3, 4, 5, 6 ]

    numbers[0..3] = 56
    assert_equal numbers, [ 56, 5, 6 ]
  end
end

describe "ArrayUtils#split_by_parity" do
  before do
    @numbers = [ 1, 2, 3, 4, 5, 6 ]
  end

  it "returns the right odd and even split" do
    odd, even = @numbers.split_by_parity

    assert_equal odd, [ 1, 3, 5 ]
    assert_equal even, [ 2, 4, 6 ]
  end

  it "throw a TypeError exception when array does not contain numbers only" do
    numbers_and_text = [ "hello", 2, 4, 9, 1, 6, 7 ]

    assert_raises(TypeError) { numbers_and_text.split_by_parity }
  end
end

describe "ArrayUtils#sparse?" do
  it "returns false for empty arrays" do
    assert_equal [].sparse?, false
  end

  it "works with nested arrays that are not sparse" do
    assert_equal [ [ 1, 2, 3, 4 ], [ 5, nil, 6, 7 ] ].sparse?, false
  end

  it "works with nested arrays that are sparse" do
    assert_equal [ [ 1, nil, nil, 4 ], [ 5, nil, nil, nil ] ].sparse?, true
  end

  it "return true when the array is sparse using default 50%" do
    assert_equal [ 1, nil, nil, 4, nil ].sparse?, true
  end

  it "return false when the array is sparse using custom threshold" do
    assert_equal [ 1, nil, nil, 4, 5 ].sparse?(0.3), true
  end

  it "return false when the array is not sparse using custom threshold" do
    assert_equal [ 1, nil, nil, 4, 5 ].sparse?(0.8), false
  end

  it "returns false when the array is not sparse" do
    assert_equal [ 1, 2, 3, 4 ].sparse?, false
  end
end
