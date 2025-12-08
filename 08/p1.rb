#!/usr/bin/env ruby
# frozen_string_literal: true

require 'set'

locs = $stdin.readlines.map { |l| l.chomp.split(',').map(&:to_i) }
dists = locs.combination(2)
            .map { |a, b| [a, b, (0..2).sum { |i| ((a[i] - b[i]) ** 2) }] }
            .sort { |a, b| a.last <=> b.last }
circuit = {}
i = 0
until i == 10
  d = (dists.shift)[0..1]
  next unless circuit[d.first].nil? || circuit[d.last].nil?

  if circuit[d.first].nil? && circuit[d.last].nil?
    circuit[d.first] = Set.new(d)
  else
    if !circuit[d.first].nil?
      circuit[d.first] << d.last
    else
      circuit[d.last] << d.first
    end
  end
  i += 1

  puts "#{circuit}"
end

puts circuit.sort_by { |k, v| v.size }
