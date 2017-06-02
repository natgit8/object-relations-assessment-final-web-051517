class Movie
  attr_accessor :title

  @@all = []

  def initialize(title)
    self.title = title
    @@all << self
  end

  def self.all
    @@all
  end

  def find_by_title(title)
    self.all.find {|m| m.title == title }
    # given a string of movie title, returns the first movie that matches
  end

  def ratings
    Ratings.all.select {|rating| rating.movie == self}
    # returns an array of all ratings for that movie
  end

  def viewers
    ratings.map {|r| r.viewer}
    # should return all of the viewers who have left ratings for that movie.
  end

  def average
    inject(:+) / size
  end

  def average_rating
    Rating.all.average
    # should return the average of all of the scores for the ratings of that particular movie.
  end

end
