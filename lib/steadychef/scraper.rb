class SteadyChef::Scraper

  def self.scrape_locations
    page = Nokogiri::HTML(open("https://coursehorse.com/nyc/classes/cooking/culinary-meals?level=beginner"))
    neighborhoods = page.css("div.field-container label")
      locations = neighborhoods.select do |neighborhood|
        neighborhood.attr("for").start_with?("borough")
      end 
      locations.each do |location|
        name = location.text
        SteadyChef::Location.new(name)
      end
  end 

  def self.scrape_courses(location)
    course_page = Nokogiri::HTML(open("https://coursehorse.com/nyc/classes/cooking/culinary-meals?level=beginner&neighborhood=#{location.name.downcase.gsub(" ", "-")}"))
      overall_course_information = course_page.css("div.filter-results-container div.filter-result-row.filter-course-item.simple-filter-course-row")
        overall_course_information.select do |course_information|
          name = course_information.css("h4.title span").text.strip
          address = course_information.css("p.course-place a").text.strip
          description = course_information.css("p.description.read.more").text.strip
          date_and_time = course_information.css("span.schedule span").text.strip
          price = course_information.css("div.course-price span").text.strip
          SteadyChef::Course.new(name, address, description, date_and_time, price, location)
        end
  end 

end 