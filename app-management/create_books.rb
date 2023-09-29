require_relative '../classes/book_class'
require_relative '../classes/label_class'
require_relative '../classes/author_class'

def create_book_method(books, authors, labels)
  @books = books
  @authors = authors
  @labels = labels

  publish_date = get_user_input('Enter publish date (YYYY-MM-DD): ')
  publisher = get_user_input('Enter author publisher name: ')
  cover_state = get_user_input('Enter cover state(Good OR Bad): ')
  author_first_name = get_user_input('Enter author first name: ')
  author_last_name = get_user_input('Enter author last name: ')
  label_title = get_user_input('Enter label title: ')
  label_color = get_user_input('Enter label color: ')
  # Create book object
  @books << Book.new(publisher, publish_date, cover_state)
  @authors << Author.new(author_first_name, author_last_name)
  @labels << Label.new(label_title, label_color)
  print @books
  save_file(@books, './data-files/books.json')
  save_file(@authors, './data-files/authors.json')
  save_file(@labels, './data-files/labels.json')
  puts "Book '#{publisher}' created successfully!"
end

def list_all_books_method(books, authors, labels)
  @books = books
  @authors = authors
  @labels = labels

  @books.each_with_index do |book, index|
    puts "Book ID: #{book['id']}"
    label = @labels[index]
    author = @authors[index]
    puts "Book Name: #{label['title']}"
    puts "Book Color: #{label['color']}"
    puts "Author Fullname: #{author['first_name']} #{author['last_name']}"
    puts "Publish Date: #{book['publish_date']}"
    puts "Publisher: #{book['publisher']}"
    puts "Cover State: #{book['cover_state']}"
    puts '----------------------'
  end
end

# list all authors method
def list_all_authors_method(authors)
  @authors = authors
  @authors.each_with_index do |author, index|
    print "#{index + 1}] "
    puts "#{author['first_name']} #{author['last_name']}"
    puts '.....................'
  end
end

# list all labels method
def list_all_labels_method(labels)
  @labels = labels
  @labels.each_with_index do |label, index|
    print "#{index + 1}] "
    puts "Title: #{label['title']} | Color: #{label['color']}"
    puts '.....................'
  end
end
