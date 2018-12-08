module Aoc
  module Templates
    def self.solution_file_template
      <<~CODE
            #!/usr/bin/env ruby

            def part1
              input = File.read('input.txt')
            end

            def part2
              input = File.read('input.txt')
            end

            puts "Solution part1: \#{part1}"
            puts "Solution part2: \#{part2}"
      CODE
    end
  end
end
