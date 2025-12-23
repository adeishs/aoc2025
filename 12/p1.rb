#!/usr/bin/env ruby
# frozen_string_literal: true

def parse_region(reg_str)
  area_str, qty_str = reg_str.split(':')
  {
    area: area_str.split('x').map(&:to_i).reduce(:*),
    qty: qty_str.split.map(&:to_i).sum
  }
end

shape_strs = $stdin.read.split("\n\n")
regions = shape_strs.pop.split("\n").map { |r| parse_region(r) }
shape = shape_strs.shift.split(":\n").last.split("\n").map(&:chomp)
shape_area = shape.first.size * shape.size

puts(regions.sum { |r| r[:area] >= shape_area * r[:qty] ? 1 : 0 })
