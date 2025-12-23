#!/usr/bin/env ruby
# frozen_string_literal: true

def parse(line)
  src, dest_str = line.split(':')

  [src, dest_str.strip.split(' ')]
end

def solve(devices, end_dest)
  prev = {}
  curr = Hash[*devices.flat_map { |k, _v| [k, k == end_dest ? 1 : 0] }]

  while curr != prev
    prev = Hash[*curr.flatten]
    curr = Hash[*prev.flat_map do |k, _v|
      [k, k == end_dest ? 1 : devices[k].map { |child| prev[child] || 0 }.sum]
    end]
  end

  curr
end

def solve_chain(devices, nodes)
  nodes.each_cons(2).map { |src, dest| solve(devices, dest)[src] }.reduce(:*)
end

devices = Hash[
  *$stdin.read.each_line.flat_map { |l| parse(l.chomp) } +
  ['out', []]
]
puts [
  %w[svr fft dac out],
  %w[svr dac fft out]
].sum { |nodes| solve_chain(devices, nodes) }
