def create_music_album_method(music_albums, genres)
  @music_albums = music_albums
  @genres = genres
  puts 'You have selected 10 - Create a music album'
  puts '##############################'
  puts '# Enter music album details: #'
  puts '##############################'
  name = get_user_input('Enter album title: ')
  publish_date = get_user_input('Enter date of release (YYYY-MM-DD): ')
  on_spotify = get_user_input('Is it on Spotify? (Y/N): ').downcase == 'y'
  genre = get_user_input('Enter the genre of the music album: ').downcase
  album = MusicAlbum.new(name, publish_date, on_spotify: on_spotify)
  new_genre = Genre.new(genre)
  @genres.push(new_genre)
  @music_albums.push(album)
  puts "Album '#{album.name}' has been added."
  puts 'You have selected 10 - Create a music album'
  save_file(@music_albums, './data-files/music_albums.json')
  save_file(@genres, './data-files/genres.json')
  @music_albums = read_file('./data-files/music_albums.json')
  @genres = read_file('./data-files/genres.json')
end

def list_all_music_albums_method(music_albums, genres)
  @music_albums = music_albums
  @genres = genres
  puts 'You have selected 2 - List all music albums'
  puts '#################'
  puts '# Music albums: #'
  puts '#################'
  @music_albums.each_with_index do |music_album, index|
    name = "#{index + 1}) Album Name: #{music_album['name']}"
    publish_date = " | publish date: #{music_album['publish_date']}"
    on_spotify = " | On Spotify: #{music_album['on_spotify'] ? 'Yes' : 'No'}"
    current_genre = @genres[index]
    genre = " | Genre: #{current_genre['name']}"
    album_info = name + publish_date + on_spotify + genre
    puts album_info
  end
end

def list_all_genres_method(genres)
  @genres = genres
  puts 'You have selected 5 - List all genres'
  @genres.each_with_index do |genre, index|
    puts "#{index + 1}. #{genre['name']}"
  end
end
