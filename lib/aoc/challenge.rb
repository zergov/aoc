require 'nokogiri'
require 'net/http'
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

        uri = URI.parse("#{url}/answer")
        http = Net::HTTP.new(uri.host, 80)

        request = Net::HTTP::Post.new(uri.request_uri)
        request["Cookie"] = "session=#{Aoc::Session.get_session}"
        request.set_form_data({level: current_level, answer: answer})

        response = http.request(request)

        case response
        when Net::HTTPSuccess then
          response.body
        when Net::HTTPMovedPermanently then
          location = response['location']
          warn "redirected to #{location}"

          uri = URI.parse(location)
          http = Net::HTTP.new(uri.host, 80)

          request = Net::HTTP::Post.new(uri.request_uri)
          request["Cookie"] = "session=#{Aoc::Session.get_session}"
          http.request(request).body
        else
          response
        end
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
