require_relative 'categories'
require_relative 'models/transaction'

module TransactionFaker
  class TransactionHelper
    def initialize()
    end

    #Creates TransactionHelper objects to determine the frequency and magnitude
    #of transactions for each one of our categories. THIS IS WHERE WE CAN TWEAK THE INPUT.
    def self.create_data
      nightlife = TransactionHelper.new(Categories::NIGHTLIFE, [15..40], 5)
      eat_out = TransactionHelper.new(Categories::EAT_OUT, [8..20], 16)

      data_array = [nightlife, eat_out]
    end

    def self.normal_distribution(mean, standard_dev, amount)
      gen = Rubystats::NormalDistribution.new(mean, standard_dev)
      array = []
      amount.times{ array << gen.rng() }
      array
    end

    #Uses the TransactionHelper objects from the array created in 'create_data' to
    #create an array of actual transactions
    def self.create_transactions(transaction_hash), account_id)
      transaction_array = []

      data_array.each do |transaction_helper|
        transaction_helper.monthly_freq.times do
          amount = transaction_helper.expense.sample
          id_num = transaction_helper.categories.sample
          cat_arr = self.create_category_array(id_num)
          transaction_array << TransactionObject.new(account_id, amount, nil, cat_arr, id_num)
        end
      end
      transaction_array
    end

    #Returns an array of strings with the category hierarchy,
    #   i.e. ["Food and Drink", "Restaurants", "Mexican"]
    def self.create_category_array(id_num)
      array = [
        "#{Categories::FIRST_DIV[self.convert_id(id_num, 1)]}",
        "#{Categories::SECOND_DIV[self.convert_id(id_num, 2)]}",
        "#{Categories::THIRD_DIV[id_num]}"
      ]
    end

    #Takes in a transaction ID number and floors it to match its superior category's ID
    #cat_division is either 1 (first category) or 2
    #   i.e. 12034890 -> 12034000 or 12034890 -> 12000000
    def self.convert_id(id_num, cat_division)
      divisor = 1000**cat_division
      converted_id = (id_num / divisor) * divisor
    end

  end
end
