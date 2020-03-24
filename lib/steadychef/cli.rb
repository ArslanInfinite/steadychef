class SteadyChef::CLI

  def start #first thing the user will see
    puts AsciiArt.kitchen
    puts ""
    puts ""
    puts "Welcome to steadychef!".blue.bright
    puts ""
    @input = ""
    until @input == "exit"
      get_locations
      list_locations
      get_user_location
      continue_or_exit
    end
      user_exit_message
  end
 
  def get_locations #retrieve all locations for user to choose from
    @locations = SteadyChef::Location.all #@locations will be available throughout all instances 
  end 

  def list_locations #show the user the months they can choose from
    puts "To choose a location, please enter the corresponding number.".blue
    puts ""
    @locations.each.with_index(1) do |location, index| 
      puts "#{index} for #{location.name}"
  end 
    puts ""
  end

  def valid_user_input(input, data) #will check to see if user choice matches backend information
    input.to_i <= data.length && input.to_i > 0
  end

  def get_user_location
    chosen_location = gets.strip.to_i
    show_courses_for(chosen_location) if valid_user_input(chosen_location, @locations)
  end 

  def show_courses_for(chosen_location) #displays the courses for that location
    location = @locations[chosen_location - 1]
    location.get_courses
      if location.courses.empty?
        puts "Sorry, there are no courses available at this time. Please select another location!".red
        puts ""
        list_locations
        get_user_location
      else
        puts "The following courses are available in #{location.name}.".blue
        puts ""
        location.courses.each.with_index(1) do |course, index|
          puts "#{index} #{course.name}" 
        end  
    get_user_course(location)
    end
    puts ""
  end 

  def get_user_course(location) #user selects a location and corresponding courses are shown
    puts ""
    puts "Select a course to see more details!".blue
    input = gets.strip
    course = location.courses[input.to_i - 1]
    show_courses(course)
    # location.get_courses
  end 

  def show_courses(course)
    puts ""
    puts course.name.magenta
    puts ""
    puts "#{course.address}.".cyan + " #{course.date_and_time}.".yellow + " #{course.price}.".green
    puts ""
    puts course.description
    puts "" 
    continue_or_exit
  end 

  def continue_or_exit
    puts "Would you like to see another course? Press any key to return to the search list or type exit to exit the program.".blue
    @input = gets.strip
    if @input == "exit"
      user_exit_message
    else 
      list_locations
      get_user_location
    end 
  end 

  def user_exit_message
    puts "Thank you for using steadychef. I wish you good fortune in the meals to come.".blue.bright
    exit 
  end 

end  