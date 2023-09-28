require_relative '../item'

class Movie < Item
  attr_accessor :silet, :genre, :author, :source, :label

  def initialize(title, silet, genre, author, source, label, publish_date, options = {})
    super(publish_date: options.fetch(:publish_date, Date.today), archived: options.fetch(:archived, false))
    @title = title
    @silet = silet
    @genre = genre
    @author = author
    @source = source
    @label = label
  end

  def can_be_archived?
    super || @silet
  end

  def move_to_archive
    return unless can_be_archived?

    @archived = true
  end

  def to_s
    "Movie: #{@title} (Silent: #{@silet}, Genre: #{@genre}, " \
      "Author: #{@author}, Source: #{@source}, Label: #{@label}, " \
      "Archived: #{@archived})"
  end
end
