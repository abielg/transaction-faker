require_relative 'categories'
require_relative 'models/transaction'

module TransactionFaker
  class TransactionHelper
    def initialize()
    end

    def self.normal_distribution(mean, standard_dev, amount)
      std_dev = 0
      # The function gen.rng() will return an error if standard_dev is 0, so 0.000001
      # provides the same functionality
      standard_dev == 0 ? std_dev = 0.000001 : std_dev = standard_dev
      gen = Rubystats::NormalDistribution.new(mean, std_dev)
      array = []
      amount.to_i.times{ array << gen.rng().round(2) }
      array
    end

    #Uses the TransactionHelper objects from the array created in 'create_data' to
    #create an array of actual transactions
    def self.create_transactions(transaction_hash, account_id)
      transaction_array = []

      transaction_hash.each do |category, data|
        subcategories = Categories::SUBCATEGORIES[category]
        normal_distribution(data[:mean], data[:std_dev], data[:monthly_freq]).each do |price|
          category_id = subcategories.sample
          cat_array = create_category_array(category_id)
          transaction_array << TransactionObject.new(account_id, price, cat_array, category_id)
        end
      end
      transaction_array
    end

    #Returns an array of strings with the category hierarchy,
    #   i.e. ["Food and Drink", "Restaurants", "Mexican"]
    def self.create_category_array(id_num)
      array = [
        "#{Categories::FIRST_DIV[convert_id(id_num, 1)]}",
        "#{Categories::SECOND_DIV[convert_id(id_num, 2)]}",
        "#{Categories::THIRD_DIV[id_num]}"
      ]
      array.reject { |string| string.empty? }
    end

    #Takes in a transaction ID number and floors it to match its superior category's ID
    #cat_division is either 1 (first category) or 2
    #   i.e. 12034890 -> 12034000 or 12034890 -> 12000000
    def self.convert_id(id_num, cat_division)
      divisor = 1000**(3 - cat_division)
      converted_id = ((id_num.to_f / divisor).to_i * divisor)
    end

  end
end
