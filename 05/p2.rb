#!/usr/bin/env ruby
# frozen_string_literal: true

require 'set'

def parse(lines)
  lines.split("\n\n")
       .first
       .split("\n")
       .map { |l| Range.new(*l.split('-').map(&:to_i)) }
end

fresh_ranges = parse($stdin.read).sort do |a, b|
  a.begin == b.begin ? a.end <=> b.end : a.begin <=> b.begin
end

ranges = [fresh_ranges.shift]
fresh_ranges.each do |r|
  ranges << if ranges.last.cover?(r.begin)
              l = ranges.pop
              Range.new(l.begin, [r.end, l.end].max)
            else
              r
            end
end
puts ranges.sum(&:size)
