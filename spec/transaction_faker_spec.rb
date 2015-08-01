require 'spec_helper'

describe TransactionFaker do
  let(:transaction_helper) { TransactionHelper.new(Categories::NIGHTLIFE, [15..40], 5) }
#categories: Categories::NIGHTLIFE, expense: [15..40], monthly_freq: 5
  it 'has a version number' do
    expect(TransactionFaker::VERSION).not_to be nil
  end

  it 'creates a transaction helper with an array of possible categories' do
    expect(transaction_helper.categories).to eq(Categories::NIGHTLIFE)
  end

end
