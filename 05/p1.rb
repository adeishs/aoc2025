#!/usr/bin/env ruby
# frozen_string_literal: true

def parse(lines)
  fresh_str, ing_str = lines.split("\n\n")

  {
    fresh_ranges: fresh_str.split("\n")
                           .map { |l| Range.new(*l.split('-').map(&:to_i)) },
    ing_ids: ing_str.split("\n").map(&:to_i)
  }
end

data = parse($stdin.read)
puts data[:ing_ids].select { |i| data[:fresh_ranges].any? { |r| r.cover?(i) } }
                   .size
