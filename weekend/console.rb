require("pry")
require_relative("./models/customers")
require_relative("./models/films")
require_relative("./models/tickets")

Ticket.delete_all
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

ticket1 = Ticket.new({ 'customer_id' => customer1.id, 'film_id' => film1.id})
ticket2 = Ticket.new({ 'customer_id' => customer2.id, 'film_id' => film2.id})
ticket3 = Ticket.new({ 'customer_id' => customer2.id, 'film_id' => film3.id})
ticket4 = Ticket.new({ 'customer_id' => customer3.id, 'film_id' => film1.id})

ticket1.save
ticket2.save
ticket3.save
ticket4.save


binding.pry
nil
