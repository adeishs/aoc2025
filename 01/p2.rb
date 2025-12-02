#!/usr/bin/env ruby
# frozen_string_literal: true

pos = 50
pass = $stdin.each_line.reduce(0) do |a, i|
  s = i[0] == 'R' ? 1 : -1
  m = i.chomp[1..].to_i
  c = m / 100
  pre = pos
  pos += s * (m % 100)

  if (pos % 100).zero? ||
     (!pre.zero? && (((pre + 100) / 100) != (pos + 100) / 100))
    c += 1
  end

  pos = (pos + 100) % 100
  a + c
end
puts pass
