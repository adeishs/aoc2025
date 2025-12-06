#!/usr/bin/env ruby
# frozen_string_literal: true

def parse(lines)
  lines.split("\n\n")
       .first
       .split("\n")
       .map { |l| Range.new(*l.split('-').map(&:to_i)) }
end

ranges =
  parse($stdin.read).sort { |a, b| a.begin <=> b.begin || a.end <=> b.end }
                    .each_with_object([]) do |curr, rs|
                      rs << if !rs.empty? && rs.last.cover?(curr.begin)
                              l = rs.pop
                              Range.new(l.begin, [curr.end, l.end].max)
                            else
                              curr
                            end
                    end
puts ranges.sum(&:size)
