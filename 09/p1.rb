#!/usr/bin/env ruby
# frozen_string_literal: true

def get_area(a, b)
  d = Complex(1, 1) + a - b
  d.real * d.imag
end

puts $stdin.readlines
           .map { |l| Complex(*l.chomp.split(',').map(&:to_i)) }
           .combination(2)
           .map { |a, b| get_area(a, b) }
           .max
