require 'spec_helper'
  describe TransactionHelper do
    mean = 15
    std_dev = 5
    amount = 50
    describe '#normal_distribution' do
      it 'creates an array with the correct mean' do
        gaussian_array = TransactionHelper.normal_distribution(mean, std_dev, amount)
        total = gaussian_array.inject(:+)
        expect(total / amount.to_f).to eq(mean)
      end

      it 'creates an array with the correct standard deviation' do
        gaussian_array = TransactionHelper.normal_distribution(mean, std_dev, amount)
        total = gaussian_array.inject(:+)
        expect(gaussian_array.standard_deviation). to eq(std_dev)
      end
    end
  end