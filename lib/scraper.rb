require 'nokogiri'
require 'open-uri'
require'pry'

require_relative './course.rb'
#require this class so that scraper can make new attributes and assing from the scraped webpage


class Scraper

    def print_courses
    self.make_courses
    Course.all.each do |course|
      if course.title
        puts "Title: #{course.title}"
        puts "  Schedule: #{course.schedule}"
        puts "  Description: #{course.description}"
      end
    end
  end

  def get_page
    doc = Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
    binding.pry
  end
end
Scraper.new.get_page
