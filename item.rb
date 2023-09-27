require 'date'

class Item
  attr_accessor :id, :genre, :author, :source, :label, :publish_date

  def initialize(publish_date: Date.today, archived: false)
    @id = id || Random.rand(1...100)
    @genre = nil
    @author = nil
    @source = nil
    @label = nil
    @publish_date = publish_date
    @archived = archived
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
