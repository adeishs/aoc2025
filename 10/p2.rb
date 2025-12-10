#!/usr/bin/env ruby
# frozen_string_literal: true

def parse(line)
  els = line.split(' ')
  light_str = els.shift
  joltages = els.pop[1...-1].split(',').map(&:to_i)
  {
    len: joltages.sum,
    light: light_str[1...-1].tr('.#', '01').reverse.to_i(2),
    buttons: els.map { |b| b[1...-1].split(',').map(&:to_i) },
    joltages: joltages
  }
end

def solve(machine)
  (1..machine[:len]).each do |n|
    machine[:buttons].repeated_permutation(n).each do |button_sets|
      currs = [0] * machine[:joltages].size
      is_over = false
      button_sets.each do |buttons|
        buttons.each do |b|
          currs[b] += 1
          if currs[b] > machine[:joltages][b]
            is_over = true
            break
          end
        end

        break if is_over
      end

      return n if machine[:joltages] == currs
    end
  end
end

puts $stdin.readlines.map { |l| solve(parse(l.chomp)) }.sum
