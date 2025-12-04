#!/usr/bin/env ruby
# frozen_string_literal: true

JOLTAGE_LEN = 12

def find_joltage(batt)
  i = 0
  (JOLTAGE_LEN..1).step(-1).reduce('') do |a, rem|
    m = batt[i..-rem].chars.max
    i += batt[i..-rem].index(m) + 1
    a + m
  end.to_i
end

sum = $stdin.each_line.reduce(0) { |a, b| a + find_joltage(b.chomp) }
puts sum
