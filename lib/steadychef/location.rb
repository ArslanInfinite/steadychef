class SteadyChef::Location
  attr_accessor :name, :courses

  @@all = []

  def initialize(name)
    @name = name
    @courses = []
    @@all << self 
  end

  def self.all
    SteadyChef::Scraper.scrape_locations if @@all.empty?
    @@all 
  end

  def get_courses
    SteadyChef::Scraper.scrape_courses(self) if @courses.empty?
  end 

end