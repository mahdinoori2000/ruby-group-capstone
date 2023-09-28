require_relative '../classes/book_class'

describe Book do
  before :each do
    @book = Book.new('Amazon', Date.today, 'bad')
  end
  describe 'Create a new book' do
    it 'Expected our new book to be an instance of Book' do
      expect(@book).to be_an_instance_of Book
    end

    it 'publisher is equal to publisher of Book' do
      expect(@book.publisher).to eq('Amazon')
    end

    it 'cover_state is equal to cover_state of Book' do
      expect(@book.cover_state).to eq('bad')
    end

    it 'can_be_archived? method test' do
      expect(@book.can_be_archived?).to eq(true)
    end
  end
end
