module TransactionFaker

  class Account
    attr_accessor :available_balance, :current_balance, :id, :institution_type

    def initialize(available_balance, current_balance)
      @id   = Faker::Lorem.characters(37)
      @institution_type  = get_random_institution
      @available_balance = available_balance
      @current_balance   = current_balance
    end

    private

    def get_random_institution
      ['amex', 'bofa', 'capone360', 'schwab', 'chase', 'citi', 'fidelity', 'pnc',
       'svb', 'us', 'usaa', 'wells'].sample
    end
  end
end