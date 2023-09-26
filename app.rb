require_relative 'app-management/ui_class'

class App
  def initialize
    @ui = UI.new
  end

  def run
    @ui.welcome
    loop do
      @ui.options
      option = gets.chomp
      break if option.downcase == 'exit'

      apply_option(option.to_i)
    end
    exit_app
  end

  # To be completed later on ↓
  def apply_option(option)
    actions = {
      1 => method(:list_all_books),
      2 => method(:list_all_music_albums),
      3 => method(:list_all_movies),
      4 => method(:list_all_games),
      5 => method(:list_all_genres),
      6 => method(:list_all_labels),
      7 => method(:list_all_authors),
      8 => method(:list_all_sources),
      9 => method(:create_book),
      10 => method(:create_music_album),
      11 => method(:create_movie),
      12 => method(:create_game),
      13 => method(:exit_app)
    }

    if actions[option]
      actions[option].call
    else
      puts '❌ Sorry! You have to select one of the options'
    end
  end

  def list_all_books
    puts 'You have selected 1 - List all books'
  end

  def list_all_music_albums
    puts 'You have selected 2 - List all music albums'
  end

  def list_all_movies
    puts 'You have selected 3 - List all movies'
  end

  def list_all_games
    puts 'You have selected 4 - List all games'
  end

  def list_all_genres
    puts 'You have selected 5 - List all genres'
  end

  def list_all_labels
    puts 'You have selected 6 - List all labels'
  end

  def list_all_authors
    puts 'You have selected 7 - List all authors'
  end

  def list_all_sources
    puts 'You have selected 8 - List all sources'
  end

  def create_book
    puts 'You have selected 9 - Create a book'
  end

  def create_music_album
    puts 'You have selected 10 - Create a music album'
  end

  def create_movie
    puts 'You have selected 11 - Create a movie'
  end

  def create_game
    puts 'You have selected 12 - Create a game'
  end

  def exit_app
    puts 'Exiting the application....'
    puts 'Goodbye!👋🏼'
    exit
  end
end
