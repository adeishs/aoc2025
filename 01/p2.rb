#!/usr/bin/env ruby

pos = 50
pass = $stdin.each_line.map do |i|
      s = i[0] == 'R' ? 1 : -1
      m = i.chomp[1..-1].to_i
      c = m / 100
      r = m % 100
      pre = pos
      pos += s * r

      if (pos % 100) == 0 ||
          (!pre.zero? && (((pre + 100) / 100) != (pos + 100) / 100))
        c += 1
      end

      pos = (pos + 100) % 100
      c
    end.sum
puts pass
