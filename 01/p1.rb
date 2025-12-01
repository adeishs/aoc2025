#!/usr/bin/env ruby

pos = 50
pass = $stdin.each_line.map do |i|
      pos += 100 + (i[0] == 'R' ? 1 : -1) * i[1...-1].to_i
      pos % 100
    end.select { |p| p.zero? }.size
puts pass
