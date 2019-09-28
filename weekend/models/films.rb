require_relative("../db/sql_runner")

class Film

  attr_reader :id
  attr_accessor :title, :price

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @price = options['price']
  end

  def save()
    sql = "INSERT INTO films (
    title, price
    )
    VALUES (
    $1, $2
    )RETURNING id"
    values = [@title, @price]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i
  end

  def self.delete_all
    sql = "DELETE FROM films"
    SqlRunner.run(sql)
  end

  def self.all
    sql = "SELECT * FROM films"
    results = SqlRunner.run(sql)
    films = results.map { |films_hash| Film.new(films_hash)}
    return films
  end






end
