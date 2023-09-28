require_relative '../classes/movie_class'

describe Movie do
  # Define test cases here

  describe '#can_be_archived?' do
    it 'returns true if silent is true' do
      movie = Movie.new(1, 'Sample Movie', silet: true)
      expect(movie.can_be_archived?).to be(true)
    end

    it 'returns true if the parent method returns true' do
      movie = Movie.new(1, 'Sample Movie', publish_date: Date.new(2000, 1, 1))
      expect(movie.can_be_archived?).to be(true)
    end

    it 'returns false if neither silent nor the parent method is true' do
      movie = Movie.new(1, 'Sample Movie')
      expect(movie.can_be_archived?).to be(false)
    end
  end
end
