require 'spec_helper'

describe TransactionHelper do
  let(:transaction_helper) { TransactionHelper.new(Categories::NIGHTLIFE, [15..40], 5) }
  let(:transaction_helper2) { TransactionHelper.new(Categories::EAT_OUT, [8..25], 16) }
  let(:account_id) { Faker::Lorem.characters(37) }

  it 'creates a transaction helper with an array of possible categories' do
    expect(transaction_helper.categories).to eq(Categories::NIGHTLIFE)
  end

  describe '#create_data' do
    it 'returns an array of transaction_helper objects' do
      expect(TransactionHelper.create_data[0]).to be_an_instance_of(TransactionHelper)
    end
  end

  describe '#create_transactions' do
    it 'returns an array of actual transactions from the array of transactionhelpers passed in' do
      array = [transaction_helper, transaction_helper2]
      expect(TransactionHelper.create_transactions(array, account_id).size()).to eq(21)
    end
  end
end