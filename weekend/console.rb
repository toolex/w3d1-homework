require("pry")
require_relative("./models/customers")
require_relative("./models/films")

Customer.delete_all
Film.delete_all

customer1 = Customer.new({ 'name' => 'Bob', 'funds' => 100})
customer2 = Customer.new({ 'name' => 'Jimmy', 'funds' => 55})
customer3 = Customer.new({ 'name' => 'Lisa', 'funds' => 75})

customer1.save
customer2.save
customer3.save

film1 = Film.new({ 'title' => 'Gravity', 'price' => 50})
film2 = Film.new({ 'title' => 'Interstellar', 'price' => 55})
film3 = Film.new({ 'title' => '2001:A Space Odydssey', 'price' => 45})

film1.save
film2.save
film3.save





binding.pry
nil
