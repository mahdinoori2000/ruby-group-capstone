class Genre
  attr_accessor :name, :items

  def initialize(name)
    @id = Random.rand(1..10_000)
    @name = name
    @items = []
  end

  def add_item(item)
    @items.push(item)
    item.genre(self)
  end
  def to_h
    {
      id: @id,
      name: @name
    } 
  end
end
