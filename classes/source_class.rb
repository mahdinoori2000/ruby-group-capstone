class Source
  attr_reader :id, :name
  attr_accessor :items

  def initialize(id, name)
    @id = id
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.add_source(self) unless item.source == self
  end

  def to_s
    "Source: #{name} (ID: #{@id})"
  end
end
