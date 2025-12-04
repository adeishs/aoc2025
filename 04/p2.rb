#!/usr/bin/env ruby
# frozen_string_literal: true

ADJS = [*-1..1].product([*-1..1]).reject { |x, y| x.zero? && y.zero? }

roll = Hash[
  *$stdin.readlines.each_with_index.map do |cols, y|
    cols.chomp.chars.each_with_index.map do |t, x|
      [Complex(x, y), t == '@']
    end
  end.flatten
]
sum = 0
loop do
  liftables = roll.select do |pos|
    roll[pos] &&
      ADJS.select { |x, y| roll[Complex(pos.real + x, pos.imag + y)] }.size < 4
  end

  break if liftables.empty?

  liftables.each_key { |pos| roll.delete(pos) }
  sum += liftables.size
end

puts sum
