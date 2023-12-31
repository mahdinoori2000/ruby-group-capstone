require_relative '../classes/game_class'
require_relative '../classes/author_class'
require_relative '../store-data/save_game_author'
require 'date'

class CreateGame
  def initialize
    @game_data_storage = StoreData.new('./data-files/games.json')
    @author_data_storage = StoreData.new('./data-files/authors.json')
    reset_arrays
  end

  def reset_arrays
    @games = []
    @authors = []
  end

  def create_game
    reset_arrays
    create_game_data
    store_data(@game_data_storage, @games)

    reset_arrays
    create_author_data
    store_data(@author_data_storage, @authors)
    puts '🟢 Games created successfully!'
    puts '🟢 Authors created successfully!'
  end

  private

  def create_game_data
    multiplayer = input_value('Multiplayer')
    last_played_at = parse_date_input(input_value('Last time played [YYYY-MM-DD]'))
    publish_date = parse_date_input(input_value('Publish date [YYYY-MM-DD]'))

    new_game = {
      multiplayer: multiplayer,
      last_played_at: last_played_at.to_s,
      publish_date: publish_date.to_s
    }
    @games.push(new_game)
  end

  def create_author_data
    author_name = input_value('Author Name')
    author_last_name = input_value('Author Last Name')

    new_author = {
      id: Random.rand(1..1000),
      first_name: author_name,
      last_name: author_last_name
    }
    @authors.push(new_author)
  end

  def input_value(prompt)
    print "#{prompt}: "
    gets.chomp
  end

  def parse_date_input(date_input)
    Date.parse(date_input)
  rescue ArgumentError
    puts '🔴 Invalid date format. Please use YYYY-MM-DD.'
    nil
  end

  def store_data(storage, data)
    storage.store(data)
  end
end
