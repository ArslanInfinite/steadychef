require_relative "./steadychef/version"
require_relative "./steadychef/cli"
require_relative "./steadychef/location"
require_relative "./steadychef/course"
require_relative "./steadychef/scraper"
require_relative "./steadychef/asciiart.rb"


require 'pry'
require 'nokogiri'
require 'open-uri'
require 'cli-colorize'

module SteadyChef
  class Error < StandardError; end
  # Your code goes here...
end

#this is the environment file for the app