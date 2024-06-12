#!/usr/bin/env ruby

require 'optparse'
require 'date'

params = ARGV.getopts('y:' 'm:')

year = params['y']&.to_i || Date.today.year
month = params['m']&.to_i || Date.today.month
lastday = Date.new(year, month, -1).day
week = []

puts "      #{month}月 #{year}"
puts '日 月 火 水 木 金 土'

(1..lastday).each do |day|
  wday = Date.new(year, month, day).wday
  if day == 1 && wday != 0
    (0..wday).each do |d|
      week[d] = '  '
    end
  end
  day < 10 ? week[wday] = " #{day}" : week[wday] = day
  if wday == 6 || day == lastday
    puts week.join(' ')
    week = []
  end
end
