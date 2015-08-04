require 'spec_helper'

describe TransactionHelper do

  describe '#normal_distribution' do
    mean = 15
    std_dev = 5
    amount = 500
    gaussian_array = TransactionHelper.normal_distribution(mean, std_dev, amount)
    it 'creates an array with the correct mean' do
      total = gaussian_array.inject(:+)
      expect(total / amount.to_f).to be_within(1).of(mean)
    end

    it 'creates an array with the correct standard deviation' do
      total = gaussian_array.inject(:+)
      expect(gaussian_array.standard_deviation).to be_within(1).of(std_dev)
    end

    it 'creates an array with the correct number of elements' do
      expect(gaussian_array.size).to eq(amount)
    end

    it 'works correctly with a 0 standard deviation' do
      expect(TransactionHelper.normal_distribution(232323, 0, 5).inject(:+)).to eq(1161615)
    end
  end

  describe '#convert_id' do
    it 'chops off 6 zeroes from top category' do
      expect(TransactionHelper.convert_id(17001003, 1)).to eq(17000000)
    end

    it 'chops off 3 zeroes from second category' do
      expect(TransactionHelper.convert_id(17001003, 2)).to eq(17001000)
    end
  end

  describe '#create_category_array' do
    it 'returns all three categories for a transaction that has them all' do
      expect(TransactionHelper.create_category_array(17001003)).to eq(
        ["Recreation", "Arts and Entertainment", "Sports Venues"])
    end

    it 'returns  two categories for a transaction that only has two' do
      expect(TransactionHelper.create_category_array(17035000)).to eq(
        ["Recreation", "Running"])
    end

    it 'returns  one category for a transaction who has only one' do
      expect(TransactionHelper.create_category_array(19000000)).to eq(
        ["Shops"])
    end
  end
end