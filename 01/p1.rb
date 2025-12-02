#!/usr/bin/env ruby
# frozen_string_literal: true

pos = 50
pass = $stdin.each_line.select do |i|
  pos += 100 + (i[0] == 'R' ? 1 : -1) * i.chomp[1..].to_i
  (pos % 100).zero?
end.size
puts pass
