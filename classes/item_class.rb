require_relative 'rental_class'

class Item
  attr_accessor :id, :genre, :author, :source, :label, :publish_date, :archived

  def initialize(genre, author, source, label, publish_date, archived: false)
    @id = id || generate_id
    @genre = genre
    @source = source
    @label = label
    @author = author
    @publish_date = publish_date
    @archived = archived
    @book = book
    @archived = archived
  end

  def can_be_archived?
    !@archived
  end

  def move_to_archive
    @archived = true
  end

  def generate_id
    rand(1..1000)
  end
end
