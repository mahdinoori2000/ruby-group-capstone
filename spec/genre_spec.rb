require_relative '../classes/genre'

describe Genre do
  let(:genre) { Genre.new('Pop') }

  describe '#initialize' do
    it 'should sets the name correctly' do
      expect(genre.name).to eq('Pop')
    end

    it 'initializes the items array' do
      expect(genre.items).to be_an(Array)
    end

    it 'should generate an ID' do
      expect(genre.instance_variable_get(:@id)).to be_an(Integer)
    end
  end
end