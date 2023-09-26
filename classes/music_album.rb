require_relative '../item' 

class MusicAlbum < Item
    attr_accessor :name, :genre, :publish_date, :on_spotify
  
    def initialize(name, publish_date, on_spotify: false, genre: [])
      super(publish_date)
      @name = name
      @publish_date = parse_publish_date(publish_date)
      @on_spotify = on_spotify
      @genre = genre
    end
    def can_be_archived?
      parent_result = super
      if parent_result && @on_spotify
        return true
      else
        return false
      end
    end 
end
