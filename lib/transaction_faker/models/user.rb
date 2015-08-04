require 'json'

module TransactionFaker
  class User
    attr_accessor :account, :transactions, :access_token

    def initialize(available_balance, current_balance, transaction_hash)
      @account = Account.new(available_balance, current_balance)
      @transactions = TransactionHelper::create_transactions(transaction_hash, account)
      @access_token = Faker::Lorem.characters(37)
    end

    def toJSON
      user_hash = {
        accounts: [
          {
            _id: @account.id,
            _item: @account.item,
            _user: @account.user,
            balance: {
              available: @account.balance["available"],
              current: @account.balance["current"]
            },
            institution_type: @account.institution_type,
            meta: @account.meta,
            type: @account.type
          }
        ],
        transactions: add_hash_transactions
      }
      JSON.pretty_generate(user_hash)
    end

    def add_hash_transactions
      transaction_array = []
      @transactions.each do |transaction|
        transaction_array << {
          _account: transaction.account.id,
          _id: transaction.id,
          amount: transaction.amount,
          date: transaction.date,
          name: transaction.name,
          meta: transaction.meta,
          pending: transaction.pending,
          type: transaction.type,
          category: transaction.category,
          category_id: transaction.category_id,
          score: transaction.score
        }
      end
      transaction_array
    end
  end
end




