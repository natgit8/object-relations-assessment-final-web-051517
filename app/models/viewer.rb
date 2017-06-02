class Viewer
  #has many ratings

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
