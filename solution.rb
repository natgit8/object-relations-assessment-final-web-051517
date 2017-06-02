# Please copy/paste all three classes into this file to submit your solution!
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
  end

  def ratings
    Ratings.all.select {|rating| rating.movie == self}
  end

  def viewers
    ratings.map {|r| r.viewer}
  end

  def average
    inject(:+) / size
  end

  def average_rating
    Rating.all.average
  end

end


class Viewer
  attr_accessor :first_name, :last_name

  @@all = []

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
    @@all << self
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.all_names
    self.all.collect {|c| c.full_name}
  end

  def self.all
    @@all
  end

  def find_by_name(name)
    self.all.find {|v| v.name == name}
  end

  def create_rating(movie, score)
    rating = Rating.new(movie, score)
    rating.viewer = self
  end

end


class Rating
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
