require_relative '../classes/music_album'

describe MusicAlbum do
  describe '#initialize' do
    it 'should sets the name, publish date and on_spotify correctly' do
      album = MusicAlbum.new('irani', '2020-12-12', on_spotify: true)

      expect(album.name).to eq('irani')
      expect(album.publish_date.strftime).to eq('2020-12-12')
      expect(album.on_spotify).to eq(true)
    end
  end

  describe '#can_be_archived?' do
    it 'should returns true if the album can be archived' do
      album = MusicAlbum.new('Irani', '1990-01-02', on_spotify: true)

      expect(album.can_be_archived?).to be true
    end

    it 'should returns false if the album cannot be archived' do
      # publish_date = Date.today.next_year.strftime
      album = MusicAlbum.new('Japani', '2022-01-02', on_spotify: false)

      expect(album.can_be_archived?).to be false
    end
  end
end
