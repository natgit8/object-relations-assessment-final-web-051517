class Rating
  #belongs to viewer && belongs to movie through viewer (join)

  attr_accessor :movie, :score
  attr_reader :viewer

  @@all = []

  def initialize(movie, score)
    @movie = movie
    @score = score
    @@all << self
  end

  def self.all
    @@all
  end

end
