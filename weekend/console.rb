require("pry")
require_relative("./models/customers")

Customer.delete_all

customer1 = Customer.new({ 'name' => 'Bob', 'funds' => 100})



binding.pry
nil
