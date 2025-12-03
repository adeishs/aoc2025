#!/usr/bin/env ruby
# frozen_string_literal: true

JOLTAGE_LEN = 12

def find_joltage(batt)
  rem = JOLTAGE_LEN
  js = []
  i = 0
  while rem.positive?
    m = batt[i..-rem].chars.max
    i += batt[i..-rem].index(m) + 1
    js << m
    rem -= 1
  end
  js.join.to_i
end

sum = $stdin.each_line.reduce(0) { |a, b| a + find_joltage(b.chomp) }
puts sum
