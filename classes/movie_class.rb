class Movie < Item
  attr_accessor :silet

  def initialize(id, title, archived: false, silet: false)
    super(id, archived: archived)
    @title = title
    @silet = silet
  end

  def can_be_archived?
    super && !@silet
  end

  def to_s
    "Movie: #{@title} (Silent: #{@silet}, Archived: #{@archived})"
  end
end
