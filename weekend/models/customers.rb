require_relative("../db/sql_runner")

class Customer

  attr_reader :id
  attr_accessor :name, :funds

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @funds = options ['funds']
  end

  def save()
    sql = "INSERT INTO customers (
    name, funds
    )
    VALUES (
    $1, $2
    )RETURNING id"
    values = [@name, @funds]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i
  end

  def update
    sql = "UPDATE customers SET (name, funds) = ($1, $2) WHERE $3 = id"
    values = [@name, @funds, @id]
    SqlRunner.run(sql, values)
  end

  def delete
    sql = "DELETE FROM tickets WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def films()
    sql = "SELECT films.* FROM films
    INNER JOIN tickets ON films.id = tickets.film_id
    WHERE customer_id = $1"
    values = [@id]
    film_hashes = SqlRunner.run(sql, values)
    return film_hashes.map{ |film| Film.new(film)}
  end

  def tickets_bought
    sql = "SELECT films.* FROM films
    INNER JOIN tickets ON films.id = tickets.film_id
    WHERE customer_id = $1"
    values = [@id]
    film_hashes = SqlRunner.run(sql, values)
    total_tickets = film_hashes.map{ |film| Film.new(film)}
    return total_tickets.length
  end

  def buy_ticket(film)
    @funds -= film.price
  end

  def self.delete_all
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end

  def self.all
    sql = "SELECT * FROM customers"
    results = SqlRunner.run(sql)
    customers = results.map { |customer_hash| Customer.new(customer_hash)}
    return customers
  end




end
