require 'date'

module TransactionFaker
  #Excluded meta
  class Transaction
    attr_accessor :id, :account, :date, :amount, :name, :meta, :location, :pending, :score, :type, :cat, :category, :category_id, :pending_transaction

    def initialize(account, amount, category_arr, cat_id, month_offset)
      @id = Faker::Lorem.characters(38)
      @account = account
      @date = generate_date(month_offset)
      @amount = amount
      @name = Faker::Company.name
      @location = create_location_hash()
      @pending = false #should this vary?
      @pendingTransaction = nil
      @score = create_score

      # Here for backwards compatibility only.
      @type = { primary: Categories.get_transaction_type(cat_id) }
      @category = category_arr
      @category_id = cat_id
      @meta = {"location" => @location["coordinates"]}
    end

    def ==(other_transaction)
      @id == other_transaction.id
    end

    private

    def generate_date(month_offset)
      today = Date.today
      month = today.prev_month(month_offset)

      start_of_month = Date.new(month.year, month.month)
      end_of_month = Date.new(start_of_month.year, start_of_month.month + 1) - 1

      Faker::Date.between(start_of_month, end_of_month).iso8601
    end

    def create_location_hash()
      hash = {
        "coordinates" => {
          "lat" => Faker::Address.latitude.to_i,
          "lon" => Faker::Address.longitude.to_i,
        }
      }
    end

    def create_score
      hash = {
        "master" => 1,
        "detail" => {
          "address" => 1,
          "city" => 1,
          "name" => 1,
          "state" => 1
        }
      }
    end
  end
end