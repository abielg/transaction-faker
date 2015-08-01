
module TransactionFaker
  class User
    attr_accessor :account, :transactions, :access_token,

    def initialize()
      self.account = ''
      self.transactions = []
      self.access_token = Faker::Lorem.characters(37)
    end

  end
end