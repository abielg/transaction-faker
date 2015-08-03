
module TransactionFaker
  class User
    attr_accessor :account, :transactions, :access_token,

    def initialize(transaction_hash)
      self.account = Faker::Lorem.characters(38)
      self.transactions = []
      self.access_token = Faker::Lorem.characters(37)
    end

    def create_transactions
      {
        "NIGHTLIFE" => {
          mean: 2, std_dev: 5, frequency: 5
        }
        "EAT_OUT" => {
          mean: 4,
        }
      }

  end
end




