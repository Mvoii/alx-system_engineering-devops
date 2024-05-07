#!/usr/bin/env ruby
# reex

puts ARGV[0].scan(/\[from:(\+?\w*)\s\[to:(\+?\w*)\]\s\[flags:(\S*)\]/).join(',')
