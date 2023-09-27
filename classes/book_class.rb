require_relative './author_class'
require_relative './label_class'
require_relative '../item'


# this is a class that inherits from Item class
class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(label, author, publisher, publish_date, cover_state)
    super(label, author, publish_date)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    super || cover_state == 'bad'
  end

  def to_h
    {
      id: @id,
      author: @author,
      label: @label,
      publish_date: @publish_date,
      publisher: @publisher,
      cover_state: @cover_state
    }
  end
end

author = Author.new('John Doe', 'kojo')
label = Label.new('The Gods are mad', 'red')
new_book = Book.new(label, author, 'publisher', '2020-03-02', 'bad')
books = [new_book]

books.each do |book|
  puts "Book ID: #{book.id}"
  puts "Book Name: #{book.label.title}"
  puts "Book Color: #{book.label.color}"
  puts "Author: #{book.author.first_name} #{book.author.last_name}"
  puts "Publish Date: #{book.publish_date}"
  puts "Publisher: #{book.publisher}"
  puts "Cover State: #{book.cover_state}"
  puts "----------------------"
end
