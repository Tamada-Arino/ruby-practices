#!/usr/bin/env ruby
# frozen_string_literal: true

scores = ARGV[0].chomp.split(',')
pitches = scores.length - 1

scores.map! do |score|
  score == 'X' ? 10 : score.to_i
end

i = 0
frame = 1
result = 0

loop do
  if frame == 10
    while i <= pitches
      result += scores[i]
      i += 1
    end
    break
  elsif scores[i] == 10
    result += 10 + scores[i + 1] + scores[i + 2]
    i += 1
    frame += 1
  elsif scores[i] + scores[i + 1] == 10
    result += 10 + scores[i + 2]
    i += 2
    frame += 1
  else
    result += scores[i] + scores[i + 1]
    i += 2
    frame += 1
  end
end

puts result
