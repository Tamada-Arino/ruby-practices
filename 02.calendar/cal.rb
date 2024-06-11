require 'optparse'
require "date"

params = ARGV.getopts("y:" "m:")

def get_year(year)
  year == nil ? Date.today.year : year.to_i
end

def get_month(month)
  month == nil ? Date.today.month : month.to_i
end

def get_lastday(year, month)
  Date.new(year, month, -1).day
end

year = get_year(params["y"])
month = get_month(params["m"])
lastday = get_lastday(year, month)
calendar = []
week = []

(1..lastday).each do |day|
  wday = Date.new(year, month, day).wday
  if day == 1 && wday != 0
    (0..wday).each do |d|
      week[d] = "  "
    end
  end
  day < 10 ? week[wday] = " #{day}" : week[wday] = day
  if wday == 6 || day == lastday
    calendar << week
    week = []
  end
end

puts "      #{month}月 #{year}"
puts "日 月 火 水 木 金 土"
puts calendar.map{|d| d.join(" ")}