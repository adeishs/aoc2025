#!/usr/bin/env ruby
# frozen_string_literal: true

def parse(line)
  els = line.split(' ')
  light_str = els.shift
  joltage_str = els.pop
  {
    len: light_str[1...-1].size,
    light: light_str[1...-1].tr('.#', '01').reverse.to_i(2),
    buttons: els.map do |b|
      b[1...-1].split(',').reduce(0) { |a, s| a ^ (1 << s.to_i) }
    end,
    joltages: joltage_str[1...-1].split(',').map(&:to_i)
  }
end

def solve(machine)
  (1..machine[:len]).each do |n|
    machine[:buttons].combination(n).each do |buttons|
      return n if machine[:light] == buttons.reduce(0) { |a, b| a ^ b }
    end
  end
end

puts $stdin.readlines.map { |l| solve(parse(l.chomp)) }.sum
