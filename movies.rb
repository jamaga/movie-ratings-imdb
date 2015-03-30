require 'imdb'

class Movies

  def initialize(file)
    @list = []
    @list_hash = {}
    @ratings = []
    File.open(file).each do |line|
      @list << line.chomp
    end
  end

  def results
    @results ||= @list.map{|title| Imdb::Search.new(title) }
  end

  def going_through_list
    @list.each do |myonemovie|
    @list_hash.merge!({myonemovie => Imdb::Search.new(myonemovie).movies.first.rating})
    end
    @list_hash
  end

  def graphic_rating
    @ratings.each do |x|
      puts '*' * x
    end
  end

  def numerical_list
    @list.each_with_index{|n,i| puts (i+1).to_s + ". " + n}
  end

end

=begin
list = Movies.new('titles_movies.txt')
p list.going_through_list
list.graphic_rating
list.numerical_list
list.results
=end

list = Movies.new('titles_movies.txt')
p list.going_through_list
