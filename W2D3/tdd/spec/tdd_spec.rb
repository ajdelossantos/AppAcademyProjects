# TDD RSPEC EX
require "tdd"

describe "Array#my_uniq" do
  context "returns a new array of the unique elements from the input array" do
    subject(:array) { [1, 2, 1, 3, 3] }

    it "does not add any unique element more than once" do
      expect(array.my_uniq.length).to eq(3)
    end

    it "returns elements in the order which they appear" do
      expect(array.my_uniq).to_not eq([3, 2, 1])
      expect(array.my_uniq).to_not eq([3, 1, 2])
      expect(array.my_uniq).to_not eq([1, 3, 2])
      expect(array.my_uniq).to_not eq([2, 1, 3])
      expect(array.my_uniq).to_not eq([2, 3, 1])
    end

    it "does NOT the call the built-in Array#uniq method" do
      expect(array).not_to receive(:uniq)
    end
  end

  it "returns an empty if an empty array is passed" do
    empty_array = []
    expect(empty_array.my_uniq).to eq([])
  end

  it "returns self if no duplicates exist" do
    array = [1, 2, 3]
    expect(array.my_uniq).to eq([1, 2, 3])
  end

end

describe "Array#two_sum" do
  subject(:array) { [-1, 0, 2, -2, 1] }

  it "does not find spurious pairs" do
    expect(array.two_sum).to_not include([4, 0])
    expect(array.two_sum).to_not include([3, 2])
    expect(array.two_sum).to_not include([1, 1])
  end

  it "only returns pairs of positions whose elements sum to zero" do
    expect(array.two_sum.all? { |arr| array[arr[0]] + array[arr[1]] == 0} ).to be true
  end

  it "finds all pairs of positions whose elements sum to zero" do
    expect(array.two_sum).to include([0, 4], [2, 3])
  end

  it "returns pairs sorted smaller index before bigger index" do
    expect(array.two_sum.all? { |arr| arr[0] < arr[1] }).to be true
  end

  it "returns an array of pairs sorted 'dictionary wise'" do
    first_el = array.two_sum.map { |arr| arr[0] }
    expect(first_el).to eq(first_el)
  end
end

describe "Array#my_transpose" do
  subject(:array) { [[0, 1, 2], [3, 4, 5], [6, 7, 8]] }

  it "does NOT the call the built-in Array#transpose method" do
    expect(array).not_to receive(:transpose)
  end

end
