require 'date'

class Item
  attr_reader :id, :genre, :author, :source, :label, :publish_date

  def initialize(label, author, publish_date, archived: false)
    @id = id || Random.rand(1...100)
    @label = label
    @author = author
    @publish_date = Date.parse(publish_date).strftime('%Y %m %d')
    @archived = archived
  end

  def add_genre=(genre)
    @genre = genre
  end

  def add_author=(author)
    @author = author
    author.add_item(self) # Add the item to the author's list of items
  end

  def add_source=(source)
    @source = source
  end

  def add_label=(label)
    @label = label
    label.items << self unless label.items.include?(self)
  end

  def add_label(label)
    @label = label
  end

  def move_to_archive
    return unless can_be_archived?

    @archived = true
  end

  private

  def can_be_archived?
    return false if publish_date.nil?

    (Time.now.year - publish_date.year) > 10
  end
end
