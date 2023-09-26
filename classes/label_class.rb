require_relative '../item.rb'

class Label
  attr_accessor :id, :title, :color

  def initialize(title, color)
    @id = id || generate_id
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items.push(item)
    item.add_label(self)
  end

  def generate_id
    rand(1..1000)
  end
end

newLabel = Label.new("title", "color")
newItem = newLabel.add_item(Item.new)
puts newItem.inspect
puts newLabel.inspect
