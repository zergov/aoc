require 'nokogiri'
require 'open-uri'

module Aoc
  class Challenge
    def initialize(day, year)
      @day = day
      @year = year
    end

    def url
      "https://adventofcode.com/#{@year}/day/#{@day}"
    end

    def part1
      @part1 ||= content.css('article.day-desc').first.text
    end

    def part2
      if content.css('article.day-desc').count > 1
        @part2 ||= content.css('article.day-desc').last.text
      else
        "Part 2 not unlocked yet"
      end
    end

    def input
      session = Aoc::Session.get_session
      @input ||= Nokogiri::HTML(open("#{url}/input", "Cookie" => "session=#{session}")).text
    end

    def content
      session = Aoc::Session.get_session
      @content ||= Nokogiri::HTML(open(url, "Cookie" => "session=#{session}"))
    end
  end
end
