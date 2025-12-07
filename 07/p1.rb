#!/usr/bin/env ruby
# frozen_string_literal: true

require 'set'

rows = $stdin.readlines.map(&:chomp)
xs = Set.new([rows.shift.index('S')])
cnt = 0
rows.each do |row|
  row.chars
     .map.with_index { |c, i| c == '^' ? i : nil }
     .reject(&:nil?)
     .each do |x|
    next unless xs.member?(x)

    xs.delete(x)
    xs << x - 1
    xs << x + 1
    cnt += 1
  end
end
puts cnt
