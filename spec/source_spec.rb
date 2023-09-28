require_relative '../classes/source_class'

describe Source do
  let(:source) { Source.new(1, 'Sample Source') }

  describe '#initialize' do
    it 'initializes with an ID and name' do
      expect(source.id).to eq(1)
      expect(source.name).to eq('Sample Source')
    end
  end

  describe '#add_item' do
    it 'adds an item to the collection of items' do
      item = double('Item')
      source.add_item(item)
      expect(source.items).to include(item)
    end
  end
end
