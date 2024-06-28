#!/usr/bin/env ruby
# frozen_string_literal: true

files = Dir.glob('*').sort

COLS = 3
max_row = files.length.ceildiv(COLS)
max_char_length = files.map(&:length).max
file_table = Array.new(max_row) { [] }
col = 0

files.each.with_index do |file, i|
  row = i % max_row
  file_table[row][col] = file.ljust(max_char_length)
  col += 1 if row == max_row - 1
end

puts(file_table.map { |file| file.join('  ') })
