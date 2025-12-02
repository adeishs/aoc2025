#!/usr/bin/env ruby
# frozen_string_literal: true

def inv_id?(str)
  str[0...str.size / 2] == str[str.size / 2..]
end

def count_inv_ids(pair_str)
  bs, es = pair_str.split('-')

  # no need to search within odd-sized string pairs
  return 0 if bs.size.odd? && es.size.odd?

  (bs.to_i..es.to_i).reduce(0) { |a, i| a + (inv_id?(i.to_s) ? i : 0) }
end

inv_sum = $stdin.readlines
                .map(&:chomp)
                .join
                .split(',')
                .reduce(0) { |a, p| a + count_inv_ids(p) }
puts inv_sum
