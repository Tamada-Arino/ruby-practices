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

week += ['  '] * first_day.wday
(first_day..last_day).each do |date|
  week << date.day.to_s.rjust(2)
  if date.saturday? || date == last_day
    puts week.join(' ')
    week = []
  end
end
