require 'spec_helper'

describe TransactionFaker do
  it 'has a version number' do
    expect(TransactionFaker::VERSION).not_to be nil
  end

  describe User
    transaction_hash = {
      "NIGHTLIFE" => {
        mean: 23, std_dev: 5, monthly_freq: 7
      },
      "EAT_OUT" => {
        mean: 16, std_dev: 8, monthly_freq: 13
      },
      "ENTERTAINMENT" => {
        mean: 40, std_dev: 25, monthly_freq: 2
      },
      "RECREATION" => {
        mean: 40, std_dev: 5, monthly_freq: 2
      },
      "UTILITIES" => {
        mean: 60, std_dev: 10, monthly_freq: 6
      },
      "HOUSE_SERVICES" => {
        mean: 50, std_dev: 10, monthly_freq: 2
      },
      "RENT" => {
        mean: 2000, std_dev:  0, monthly_freq: 1
      },
      "DEFAULT_EXPENSES" => {
        mean: 180, std_dev: 30, monthly_freq: 2
      },
      "PERSONAL_CARE" => {
        mean: 40, std_dev: 10, monthly_freq: 2
      },
      "GROCERIES" => {
        mean: 40, std_dev: 15, monthly_freq: 4
      },
      "SHOPPING" => {
        mean: 60, std_dev: 30, monthly_freq: 3
      },
      "RIDE_SHARING" => {
        mean: 8 , std_dev: 3, monthly_freq: 8
      },
      "DAILY_COMMUTE" => {
        mean: 130, std_dev: 0, monthly_freq: 1
      },
      "INCOME" => {
        mean: -500, std_dev: 100, monthly_freq: 1
      },
      "PAYROLL" => {
        mean: -2000, std_dev: 0, monthly_freq: 2
      }
    }

    user = User.new(1100, 1200, transaction_hash)

    it 'creates a user with correct number of transactions' do
      expect(user.transactions.size).to eq(168)
    end

    it 'creates a user with a correct account' do
      expect(user.account.balance["available"]).to eq(1100)
    end

    it 'generates the same user when Kernel.srand is set to the same value' do
      user1 = User.new(1100, 1200, transaction_hash, 1234)
      user2 = User.new(1100, 1200, transaction_hash, 1234)
      expect(user1).to eq(user2)
    end

    it 'generates different users when Kernel.srand is not used' do
      user1 = User.new(1100, 1200, transaction_hash)
      user2 = User.new(1100, 1200, transaction_hash)
      expect(user1).not_to eql(user2)
    end
  end
