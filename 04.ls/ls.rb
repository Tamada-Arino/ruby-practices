#!/usr/bin/env ruby

files = Dir.glob("*").sort

cols = 3
max_row = (files.length / cols.to_f).ceil
max_length = files.map(&:length).max
print_files = Array.new(max_row) { Array.new(cols) }
col = 0

files.each.with_index do |file, i|
  row = i % max_row
  print_files[row][col] = file.ljust(max_length)
  col += 1 if row == max_row - 1
end

puts print_files.map{|d| d.join("  ")}
