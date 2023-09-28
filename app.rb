require_relative 'app-management/ui_class'
require_relative 'app-management/save_data'
require_relative 'classes/music_album'
require_relative 'classes/genre'
require_relative 'classes/movie_class'
require_relative 'classes/source_class'

class App
  def initialize
    @ui = UI.new
    # @music_albums = []
    # @genres = []
    @movies = read_file('./data/movies.json')
    @authors = read_file('./data/authors.json')
    @sources = read_file('./data/sources.json')
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
    puts '#################'
    puts '# Music albums: #'
    puts '#################'
    @music_albums.each_with_index do |music_album, index|
      name = "#{index + 1}) Album Name: #{music_album.name}"
      publish_date = " | publish date: #{music_album.publish_date}"
      on_spotify = " | On Spotify: #{music_album.on_spotify ? 'Yes' : 'No'}"
      genre = " | Genre: #{@genres[index]}"
      album_info = name + publish_date + on_spotify + genre
      puts album_info
    end
  end

  def list_all_movies
    puts 'You have selected 3 - List all movies'
  end

  def list_all_games
    puts 'You have selected 4 - List all games'
  end

  def list_all_genres
    @genres.uniq.each_with_index do |genre, index|
      puts "#{index + 1}. #{genre}"
    end
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
    puts '##############################'
    puts '# Enter music album details: #'
    puts '##############################'
    name = get_user_input('Enter album title: ')
    publish_date = get_user_input('Enter date of release (YYYY-MM-DD): ')
    on_spotify = get_user_input('Is it on Spotify? (Y/N): ').downcase == 'y'
    genre = get_user_input('Enter the genre of the music album: ').downcase
    album = MusicAlbum.new(name, publish_date, on_spotify: on_spotify)
    new_genre = Genre.new(genre)
    @genres.push(new_genre.name)
    @music_albums.push(album)
    puts "Album '#{album.name}' has been added."
  end

  def create_movie
    puts 'You have selected 11 - Create a movie'
    title = get_user_input('Enter movie title: ')
    silet = get_user_input('Is it silent? (true/false): ').downcase == 'true'
    genre = get_user_input('Enter movie genre: ')
    author_first_name = get_user_input('Enter author first name: ')
    author_last_name = get_user_input('Enter author last name: ')
    source_id = get_user_input('Enter source ID: ').to_i
    source_name = get_user_input('Enter source name: ')
    label = get_user_input('Enter label: ')
    publish_date = Date.parse(get_user_input('Enter publish date (YYYY-MM-DD): '))

    @movies << Movie.new(title,silet, genre, label, publish_date)
    @authors << Author.new(author_first_name, author_last_name)
    @sources << Source.new(source_id,source_name)

    print @movies
    save_file(@movies, './data/movies.json')
    save_file(@authors, './data/authors.json')
    save_file(@sources, './data/sources.json')

    puts "Movie '#{title}' created successfully"
  end

  # Helper methods
  def get_user_input(prompt)
    print prompt
    gets.chomp
  end

  def create_movie_object(title, silet, genre, label, publish_date)
    Movie.new(1, title, silet: silet, genre: genre, label: label, publish_date: publish_date)
  end

  def create_author_object(first_name, last_name)
    Author.new(first_name, last_name)
  end

  def create_source_object(id, name)
    Source.new(id, name)
  end

  def associate_objects(movie, author, source)
    author.add_item(movie)
    movie.add_author(author)
    source.add_item(movie)
    movie.add_source(source)
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
