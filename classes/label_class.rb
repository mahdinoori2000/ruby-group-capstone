require_relative '../item'

class Label
  attr_accessor :id, :title, :color

  def initialize(title, color)
    @id = id || generate_id
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item
    item.add_label(self)
  end

  def generate_id
    rand(1..1000)
  end

  def to_h
    {
      id: @id,
      title: @title,
      color: @color
    }
  end
end
# new_item = Item.new('2020-03-02')
# new_label = Label.new('title', 'color')
# new_label.add_item = 'new label'
# puts new_label.inspect
