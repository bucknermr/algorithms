require_relative '../product_of_other_numbers'

describe "products_excluding_index" do
  describe "greedy solution" do
    it "should raise an error with less than 2 integers" do
      expect { products_excluding_index([]) }.to raise_error(ArgumentError, "Need at least 2 integers")
      expect { products_excluding_index([0]) }.to raise_error(ArgumentError, "Need at least 2 integers")
      expect { products_excluding_index([1]) }.to raise_error(ArgumentError, "Need at least 2 integers")
    end
    it "should work with no zeros" do
      arr1 = [1, 2, 3, 4, 5]
      arr2 = [5, 4, 3, 2, 1]
      result = [24, 30, 40, 60, 120]
      expect(products_excluding_index(arr2)).to eq(result)
      expect(products_excluding_index(arr1)).to eq(result.reverse)
    end

    it "should work with one zero" do
      arr1 = [3, 4, 0, 6, -2]
      result = [0, 0, -144, 0, 0]
      expect(products_excluding_index(arr1)).to eq(result)
    end

    it "should work with multiple zeros" do
      arr1 = [-123, 56, 23456, 23, 0, 56, 4, 2, 0]
      result = [0, 0, 0, 0, 0, 0, 0, 0, 0]
      expect(products_excluding_index(arr1)).to eq(result)
    end
  end

  describe "division solution" do
    it "should raise an error with less than 2 integers" do
      expect { products_excluding_index_division([]) }.to raise_error(ArgumentError, "Need at least 2 integers")
      expect { products_excluding_index_division([0]) }.to raise_error(ArgumentError, "Need at least 2 integers")
      expect { products_excluding_index_division([1]) }.to raise_error(ArgumentError, "Need at least 2 integers")
    end
    it "should work with no zeros" do
      arr1 = [1, 2, 3, 4, 5]
      arr2 = [5, 4, 3, 2, 1]
      result = [24, 30, 40, 60, 120]
      expect(products_excluding_index_division(arr2)).to eq(result)
      expect(products_excluding_index_division(arr1)).to eq(result.reverse)
    end

    it "should work with one zero" do
      arr1 = [3, 4, 0, 6, -2]
      result = [0, 0, -144, 0, 0]
      expect(products_excluding_index_division(arr1)).to eq(result)
    end

    it "should work with multiple zeros" do
      arr1 = [-123, 56, 23456, 23, 0, 56, 4, 2, 0]
      result = [0, 0, 0, 0, 0, 0, 0, 0, 0]
      expect(products_excluding_index_division(arr1)).to eq(result)
    end
  end
end
