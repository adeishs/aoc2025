#!/usr/bin/env ruby
# frozen_string_literal: true

pos = 50
pass = $stdin.each_line.map do |i|
  pos += 100 + (i[0] == 'R' ? 1 : -1) * i[1...-1].to_i
  pos % 100
end.select(&:zero?).size
puts pass
