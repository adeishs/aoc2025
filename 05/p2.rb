#!/usr/bin/env ruby
# frozen_string_literal: true

require 'set'

def parse(lines)
  fresh_str, ing_str = lines.split("\n\n")

  {
    fresh_ranges: fresh_str.split("\n")
                           .map { |l| Range.new(*l.split('-').map(&:to_i)) },
    ing_ids: ing_str.split("\n").map(&:to_i)
  }
end

data = parse($stdin.read)
ranges = data[:fresh_ranges].sort_by(&:begin).each_with_object([]) do |r, a|
  if a.any? && r.begin.between?(a.last.begin, a.last.end)
    last = a.pop
    a << Range.new(last.begin, r.end)
  else
    a << r
  end
end
puts(ranges.sum(&:size))
