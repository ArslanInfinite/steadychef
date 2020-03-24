class SteadyChef::Course

  attr_accessor :name, :address, :description, :date_and_time, :price, :location 

  @@all = []

  def initialize(name, address, description, date_and_time, price, location)
    @name = name
    @address = address
    @description = description
    @date_and_time = date_and_time
    @price = price
    @location = location
    add_to_location
    @@all << self 
  end

  def self.all
    @@all 
  end

  def add_to_location #will funnel the newly created course instance into the corresponding array for the location
    @location.courses << self unless @location.courses.include?(self)
  end 

end