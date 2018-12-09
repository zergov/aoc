require 'nokogiri'
require 'http'
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
      if part2?
        @part2 ||= content.css('article.day-desc').last.text
      else
        "Part 2 not unlocked yet"
      end
    end

    def part2?
      content.css('article.day-desc').count > 1
    end

    def submit(answer)
      unless completed?
        current_level = content.at('input[@name="level"]')["value"]
        response = HTTP.cookies(session: Aoc::Session.get_session)
          .post("#{url}/answer", form: {level: current_level, answer: answer})

        puts Nokogiri::HTML(response.to_s).css('main').text
      else
        "This challenge is already completed!"
      end
    end

    def input
      session = Aoc::Session.get_session
      @input ||= Nokogiri::HTML(open("#{url}/input", "Cookie" => "session=#{session}")).text
    end

    def completed?
      content.text.include?("Both parts of this puzzle are complete!")
    end

    private

    def content
      session = Aoc::Session.get_session
      @content ||= Nokogiri::HTML(open(url, "Cookie" => "session=#{session}"))
    end
  end
end
