require_relative 'person_class'
require_relative 'book_class'

class Rental
  attr_accessor :id, :genre, :author, :source, :label, :publish_date, :archived

  def initialize(genre, author, source, label, publish_date, archived: false)
    @genre = genre
    @source = source
    @label = label
    @author = author
    @publish_date = publish_date
    @archived = archived
    person.rentals << self
    @book = book
    book.rentals << self
    @id = id || generate_id
    @archived = archived
  end

  def generate_id
    rand(1..1000)
  end
end
