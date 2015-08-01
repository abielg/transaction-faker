require_relative 'categories'

module TransactionFaker
  class TransactionHelper
    attr_accessor :categories, :expense, :monthly_freq

    def initializer(categories, expense, monthly_freq)
      @categories = categories
      @expense = expense
      @monthly_freq = monthly_freq
    end

    #Creates TransactionHelper objects to determine the frequency and magnitude
    #of transactions for each one of our categories. THIS IS WHERE WE CAN TWEAK THE INPUT.
    def self.create_data
      nightlife = TransactionHelper.new(categories: Categories::NIGHTLIFE, expense: [15..40], monthly_freq: 5)
      eat_out = TransactionHelper.new(categories: Categories::EAT_OUT, expense: [8..20], monthly_freq: 16)

      data_array = [nightlife, eat_out]
    end

    #Uses the TransactionHelper objects from the array created in 'create_data' to
    #create an array of actual transactions
    def create_transactions
      data_array = create_data
      transaction_array = []

      data_array.each do |transaction|
        cat_arr = create_category_array(id_num)
        transaction.monthly_freq.times do
          amount = transaction.expense.sample
          id_num = transaction.categories.sample
          transaction_array << TransactionObject(account_num, amount, nil, cat_arr, id_num)
        end
      end
      transaction_array
    end

    #Returns an array of strings with the category hierarchy,
    #   i.e. ["Food and Drink", "Restaurants", "Mexican"]
    def create_category_array(id_num)
      array = [
        "#{Categories::FIRST_DIV[convert_id(id_num, 1)]}",
        "#{Categories::SECOND_DIV[convert_id(id_num, 2)]}",
        "#{Categories::THIRD_DIV[id_num]}"
      ]
    end

    #Takes in a transaction ID number and floors it to match its superior category's ID
    #cat_division is either 1 (first category) or 2
    #   i.e. 12034890 -> 12034000 or 12034890 -> 12000000
    def convert_id(id_num, cat_division)
      divisor = 1000**cat_division
      converted_id = (id_num / divisor) * divisor
    end

  end
end
