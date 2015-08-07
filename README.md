# TransactionFaker

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'transaction_faker'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install transaction_faker

## Usage

We created categories that can model a person’s spending patterns, and they are populated with a few of Plaid’s categories to create the transactions. Here are our categories:



<b>NIGHTLIFE</b>  
Food and Drink > Bar  
Food and Drink > Nightlife > Night Clubs  
Shops > Food and Beverage Store > Beer, Wine and Spirits  

<b>EAT_OUT</b>  
Food and Drink > Restaurants > Steakhouses  
Food and Drink > Restaurants > Mexican  
Food and Drink > Restaurants > Japanese  
Food and Drink > Restaurants > Latin American  
Food and Drink > Restaurants > Coffee Shop  

<b>ENTERTAINMENT</b>  
Recreation > Arts and Entertainment > Movie Theatres  
Recreation > Arts and Entertainment > Sports Venues  
Recreation > Arts and Entertainment > Entertainment  

<b>RECREATION</b>  
Recreation > Gyms and Fitness Centers  
Recreation > Hunting and Fishing  
Recreation > Batting Cages  

<b>UTILITIES</b>  
Service > Cable  
Service > Telecommunication Services  
Service > Internet Services  
Service > Utilities > Water  
Service > Utilities > Heating, Ventilating, and Air Conditioning  
Service > Utilities > Gas  
Service > Utilities > Electric  

<b>HOUSE_SERVICES</b>  
Service > Home Improvement > Plumbing  
Service > Cleaning  
Service > Real Estate > Apartments, Condos and Houses  

<b>RENT</b>  
Payment > Rent  

<b>DEFAULT_EXPENSES</b>  
Service > Financial > Taxes  
Service > Financial > ATMs  
Bank Fees > ATM  

<b>PERSONAL_CARE</b>  
Service > Personal Care > Hair Salons and Barbers  
Healthcare > Healthcare Services > Dentists  
Shops > Pharmacies  

<b>GROCERIES</b>  
Shops > Food and Beverage Store > Health Food  
Shops > Food and Beverage Store > Farmers Markets  

<b>SHOPPING</b>  
Shops > Outlet > Women's Store  

<b>RIDE_SHARING</b>  
Travel > Car Service > Ride Share  

<b>DAILY_COMMUTE</b>  
Travel > Public Transportation Services  

<b>INCOME</b>  
Tax > Refund  
Transfer > Deposit  

<b>PAYROLL</b>  
Transfer > Payroll  



Create a hash where keys are the categories you want to include, and the values are a hash containing the mean, standard deviation, and monthly frequency of the transaction you want to create. Choose an "available balance" and a "current balance" for the fake user, and then initialize it by passing in these two numbers and the transaction hash to its initializer. Example:

    transaction_hash = {
      "NIGHTLIFE" => {
        mean: 23, std_dev: 5, monthly_freq: 7
      },
      "EAT_OUT" => {
        mean: 16, std_dev: 8, monthly_freq: 13
      },
      "ENTERTAINMENT" => {
        mean: 40, std_dev: 25, monthly_freq: 2
      },
      "RECREATION" => {
        mean: 40, std_dev: 5, monthly_freq: 2
      },
      "UTILITIES" => {
        mean: 60, std_dev: 10, monthly_freq: 6
      },
      "HOUSE_SERVICES" => {
        mean: 50, std_dev: 10, monthly_freq: 2
      },
      "RENT" => {
        mean: 2000, std_dev:  0, monthly_freq: 1
      },
      "DEFAULT_EXPENSES" => {
        mean: 180, std_dev: 30, monthly_freq: 2
      },
      "PERSONAL_CARE" => {
        mean: 40, std_dev: 10, monthly_freq: 2
      },
      "GROCERIES" => {
        mean: 40, std_dev: 15, monthly_freq: 4
      },
      "SHOPPING" => {
        mean: 60, std_dev: 30, monthly_freq: 3
      },
      "RIDE_SHARING" => {
        mean: 8, std_dev: 3, monthly_freq: 8
      }
      "PUBLIC_TRANSPORT" => {
        mean: 130, std_dev: 0, monthly_freq: 1
      },
      "INCOME" => {
        mean: -500, std_dev: 100, monthly_freq: 1
      },
      "PAYROLL" => {
        mean: -2000, std_dev: 0, monthly_freq: 2
      }
    }


    user = User.new(1100, 1200, transaction_hash)

Once you have the user object created, you can call the "to_json" method to return the user’s account and transactions in JSON form.

    json_format = user.to_json
    
If you need to recreate the same user and transactions from a previous iteration, pass in the seed number as a 4th argument to the user's initializer, so that 'srand()' will be called with the provided seed.

    user = User.new(1100, 1200, transaction_hash, 1234)

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/transaction_faker.

# transaction-faker
