require_relative '../item'

# this is a class that inherits from Item class
class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(publisher, cover_state)
    super()
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    super || cover_state == 'bad'
  end
end

new_book = Book.new('publisher', 'bad')
new_book.genre = 'genre'
new_book.author = 'author'
puts new_book.inspect
