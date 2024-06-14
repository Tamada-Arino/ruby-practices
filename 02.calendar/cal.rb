#!/usr/bin/env ruby

require 'optparse'
require 'date'

params = ARGV.getopts('y:' 'm:')

year = params['y']&.to_i || Date.today.year
month = params['m']&.to_i || Date.today.month
first_day = Date.new(year, month, 1)
last_day = Date.new(year, month, -1)
week = []

puts "      #{month}月 #{year}"
puts '日 月 火 水 木 金 土'

(first_day..last_day).each do |date|
  if date == first_day && !date.sunday?
    (1..(date.wday)).each do |d|
      week << '  '
    end
  end
  week << (date.day < 10 ? " #{date.day}" : date.day)
  if date.saturday? || date == last_day
    puts week.join(' ')
    week = []
  end
end
