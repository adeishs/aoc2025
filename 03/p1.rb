#!/usr/bin/env ruby
# frozen_string_literal: true

def find_joltage(batt)
  m = batt[0...-1].chars.max
  i = batt[0...-1].index(m)
  l = batt[i + 1..].chars.max
  "#{m}#{l}".to_i
end

sum = $stdin.each_line.reduce(0) { |a, b| a + find_joltage(b.chomp) }
puts sum
