class Rental
  attr_accessor :date, :book, :person

  def initialize(date, person, book)
    @date = date
    @book = book
    @person = person

    person.rentals << self
    book.rental << self
  end

  def self.all
    ObjectSpace.each_object(self).to_a
  end
end
