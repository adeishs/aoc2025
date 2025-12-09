#!/usr/bin/env ruby
# frozen_string_literal: true

puts $stdin.readlines
           .map { |l| Complex(*l.chomp.split(',').map(&:to_i)) }
           .combination(2)
           .map { |a, b| (a - b).rect.reduce(1) { |m, c| m * (c.abs + 1) } }
           .max
