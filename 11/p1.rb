#!/usr/bin/env ruby
# frozen_string_literal: true

require 'set'

def parse(line)
  src, dest_str = line.split(':')

  [src, dest_str.strip.split(' ')]
end

def solve(devices)
  devices = devices.reject { |_, dests| dests.any? { |d| d == 'you' } }

  until devices['you'].all? { |d| d == 'out' }
    new_dests = []
    deleted_dests = Set.new
    devices['you'].each do |d|
      if d == 'out'
        new_dests.push(d)
      else
        new_dests.push(*devices[d])
        deleted_dests << d
      end
    end

    devices['you'] = new_dests
    devices.delete_if { |k, _| deleted_dests.member?(k) }
  end

  devices['you'].size
end

devices = Hash[*$stdin.read.each_line.flat_map { |l| parse(l.chomp) }]
puts solve(devices)
