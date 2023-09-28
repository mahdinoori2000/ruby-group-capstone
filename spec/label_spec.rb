require_relative '../classes/label_class'

describe Label do
  before :each do
    @label = Label.new('test', 'red')
  end

  describe 'Create a new label' do
    it 'Expected our new label to be an instance of Label' do
      expect(@label).to be_an_instance_of Label
    end

    it 'title is equal to title of Label' do
      expect(@label.title).to eq('test')
    end

    it 'color is equal to color of Label' do
      expect(@label.color).to eq('red')
    end
  end
end
