class Genre
  attr_accessor :id, :name

  def initialize(name)
    @id = id || generate_id
    @name = name
    @items = []
  end

  def add_item(item)
    @items.push(item)
    item.genre = self
  end

  def generate_id
    rand(1..1000)
  end
end
