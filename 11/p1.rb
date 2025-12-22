#!/usr/bin/env ruby
# frozen_string_literal: true

require 'set'

def parse(line)
  src, dest_str = line.split(':')

  [src, dest_str.strip.split(' ')]
end

def solve(devices)
  until devices['you'].all? { |d| d == 'out' }
    devices['you'] = devices['you'].flat_map { |d| d == 'out' ? d : devices[d] }
  end

  devices['you'].size
end

devices = Hash[*$stdin.read.each_line.flat_map { |l| parse(l.chomp) }]
puts solve(devices)
