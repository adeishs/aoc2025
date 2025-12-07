#!/usr/bin/env ruby
# frozen_string_literal: true

rows = $stdin.readlines.map(&:chomp)
operators = rows.pop
                .chars
                .map.with_index { |c, i| { op: c, pos: i } }
                .reject { |o| o[:op] == ' ' }
results = (
  operators + [{ pos: operators.last[:pos] + 4 }]
).each_cons(2).each_with_object([]) do |ops, result|
  vals = (
    ops.first[:pos]...ops.last[:pos] - 1
  ).each_with_object([]) { |i, os| os << rows.map { |r| r[i] }.join.to_i }

  while vals.size > 1
    operands = vals.pop(2)
    vals << operands.first.send(ops.first[:op], operands.last)
  end
  result << vals.first
end
puts results.sum
