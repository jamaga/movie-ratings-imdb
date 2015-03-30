require 'imdb'

class Movies

  def initialize(file)
    @list = []
    @list_hash = {}
    @ratings = []
    #@ratings = [7.8, 8.3, 9.2, 7.4, 7.7, 8.0, 7.7]
    File.open(file).each do |line|
      @list << line.chomp
    end
  end

  def results
    @results ||= @list.map{|title| Imdb::Search.new(title) }
  end

  def going_through_list
    @list.each do |myonemovie|
      @ratings << Imdb::Search.new(myonemovie).movies.first.rating
    end

    @ratings
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

list = Movies.new('titles_movies.txt')

list.going_through_list

list.graphic_rating

list.numerical_list
