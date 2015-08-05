module TransactionFaker
  #Excluded meta
  class Transaction
    attr_accessor :id, :account, :date, :amount, :name, :meta, :location, :pending, :score, :type, :cat, :category, :category_id, :pending_transaction

    def initialize(account, amount, category_arr, cat_id, days_ago)
      @id = Faker::Lorem.characters(38)
      @account = account
      @date = Faker::Date.between(Faker::Date.backward(days_ago), Faker::Date.backward(days_ago - 30))
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

    private
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