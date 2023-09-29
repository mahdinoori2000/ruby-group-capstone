require_relative '../classes/music_album'

describe MusicAlbum do
  describe '#initialize' do
    it 'should sets the name, publish date and on_spotify correctly' do

      album = MusicAlbum.new('irani', '2020-12-12', on_spotify: true)

      expect(album.name).to eq('irani')
      expect(album.publish_date).to eq('2020-12-12')
      expect(album.on_spotify).to eq(true)
    end
  end
end