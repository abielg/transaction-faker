module TransactionFaker
  #Excluded meta
  class TransactionObject
    attr_accessor :id, :account, :date, :amount, :name, :meta, :location, :pending, :score, :cat, :category, :category_id, :pending_transaction

    def initialize(account, amount, type, category_arr, id)
      @id = Faker::Lorem.characters(38)
      @account = account
      @date = Faker::Date.between(90.days.ago, Date.today)
      @amount = amount
      @name = Faker::Company.name
      @location = create_location_hash()
      @pending = false #should this vary?
      @pendingTransaction = nil
      @score = create_score
      @cat = create_category_id

      # Here for backwards compatibility only.
      @type = type
      @category = category_arr
      @category_id = create_category_id(type, category_arr, id)
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

      def create_category_id(id, category_arr, type)
        hash = {
          'category_id' => id,
          'hierarchy' => category_arr,
          'type' => type
        }
      end
  end
end