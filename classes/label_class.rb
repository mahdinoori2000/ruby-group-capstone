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
    item.label = self
  end

  def generate_id
    rand(1..1000)
  end
end
