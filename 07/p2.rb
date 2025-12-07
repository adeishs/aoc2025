#!/usr/bin/env ruby
# frozen_string_literal: true

coords = $stdin.readlines
               .flat_map.with_index do |row, y|
                 row.chars.map.with_index do |c, x|
                   c == '^' ? Complex(x, y) : nil
                 end
               end.reject(&:nil?)
splits = Hash.new(0)
splits[coords.first] = 1

coords[1...coords.size].each.with_index do |curr, i|
  coords[
    0..i
  ].reject { |prev| prev.imag == curr.imag || (prev.real - curr.real).abs > 1 }
    .reverse_each do |prev|
    break if prev.real == curr.real

    splits[curr] += splits[prev]
  end
end

puts splits.values.sum + 1
