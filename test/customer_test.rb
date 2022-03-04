require 'minitest/autorun'
require_relative '../lib/movie'
require_relative '../lib/rental'
require_relative '../lib/customer'

class CustomerTest < Minitest::Test
  def setup
    @movie_1 = Movie.new("Dune", Movie::NEW_RELEASE)
    @movie_2 = Movie.new("Star Wars", Movie::REGULAR)
    @movie_3 = Movie.new("The Incredibles", Movie::CHILDRENS)

    @rental_1 = Rental.new(@movie_1, 2)
    @rental_2 = Rental.new(@movie_2, 3)
    @rental_3 = Rental.new(@movie_3, 4)

    @customer = Customer.new("Alex")
    @customer.add_rental(@rental_1)
    @customer.add_rental(@rental_2)
    @customer.add_rental(@rental_3)
  end

  def test_statement_generates_a_statement
    expected = <<~STATEMENT
      Rental Record for Alex
      \tDune\t6
      \tStar Wars\t3.5
      \tThe Incredibles\t3.0
      Amount owed is 12.5
      You earned 4 frequent renter points
    STATEMENT

    assert_equal @customer.statement, expected.chomp
  end
end
