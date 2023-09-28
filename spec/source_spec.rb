require_relative '../classes/source_class'

describe Source do
  before(:each) do
    @source = Source.new(1, 'Source Name')
    @item = double('Item')
  end

  it 'has an id' do
    expect(@source.id).to eq(1)
  end

  it 'has a name' do
    expect(@source.name).to eq('Source Name')
  end

  it 'can add an item' do
    allow(@item).to receive(:source).and_return(@source)

    @source.add_item(@item)

    expect(@source.items).to include(@item)
  end

  it 'returns a hash representation' do
    expected_hash = {
      id: 1,
      name: 'Source Name'
    }
    expect(@source.to_h).to eq(expected_hash)
  end
end
