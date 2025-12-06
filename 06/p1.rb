#!/usr/bin/env ruby
# frozen_string_literal: true

rows = $stdin.readlines.map { |l| l.chomp.strip.split(/\s+/) }
operators = rows.pop

vals = rows.map { |cols| cols.map(&:to_i) }
while vals.size > 1
  operands = vals.pop(2)
  vals << operators.map.with_index do |o, i|
    operands.first[i].send(o, operands.last[i])
  end
end
puts vals.first.sum
