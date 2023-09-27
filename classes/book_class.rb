require_relative '../item'

# this is a class that inherits from Item class
class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(publisher, publish_date, cover_state)
    super(publish_date)
    @publisher = publisher
    @cover_state = cover_state
    @publish_date = publish_date
  end

  def can_be_archived?
    super || cover_state == 'bad'
  end

  def to_h
    {
      id: @id,
      publish_date: @publish_date,
      publisher: @publisher,
      cover_state: @cover_state
    }
  end
end
