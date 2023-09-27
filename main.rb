require_relative 'app'
require_relative 'classes/movie_class'
require_relative 'classes/source_class'
require_relative 'classes/author_class'

def main
  app = App.new
  app.run
end

main
