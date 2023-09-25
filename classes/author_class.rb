class Author
  attr_accessor :id, :first_name, :last_name

  def initialize(first_name, last_name)
    @id = id || generate_id
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    @items.push(item)
    item.author = self
  end

  def generate_id
    rand(1..1000)
  end
end
