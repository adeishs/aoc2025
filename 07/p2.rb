#!/usr/bin/env ruby
# frozen_string_literal: true

coords = $stdin.readlines
               .map.with_index do |row, y|
                 row.chars.map.with_index do |c, x|
                   c == '^' ? Complex(x, y) : nil
                 end
               end.flatten.reject(&:nil?)
splits = Hash.new(0)
splits[coords.first] = 1

(1...coords.size).each do |i|
  curr = coords[i]
  (i - 1..0).step(-1).each do |j|
    prev = coords[j]
    break if prev.real == curr.real

    splits[curr] += splits[prev] if (prev.real - curr.real).abs == 1
  end
end

puts splits.values.sum + 1
