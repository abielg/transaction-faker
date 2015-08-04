module TransactionFaker

  class Account
    attr_accessor :balance, :id, :institution_type, :item, :user, :type, :meta

    def initialize(available_balance, current_balance)
      @id   = Faker::Lorem.characters(37)
      @item = Faker::Lorem.characters(37)
      @user = Faker::Lorem.characters(37)
      @institution_type  = get_random_institution
      @balance = get_balance(available_balance, current_balance)
      @meta = get_meta
      @type = "depository"
    end

    private

    def get_random_institution
      ['amex', 'bofa', 'capone360', 'schwab', 'chase', 'citi', 'fidelity', 'pnc',
       'svb', 'us', 'usaa', 'wells'].sample
    end

    def get_balance(available_balance, current_balance)
      balance = {
        "available" => available_balance,
        "current" => current_balance
      }
    end

    def get_meta
      meta = {
        "name" => get_account_name,
        "number" => Faker::Number.number(4)
      }
    end

    def get_account_name
      string = Faker::Name.name
      (rand >= 0.5) ? string += "'s Savings" : string += "'s Checking"
      string
    end
  end
end