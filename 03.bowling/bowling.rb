#!/usr/bin/env ruby
# frozen_string_literal: true

scores = ARGV[0].chomp.split(',')
scores_length = scores.length - 1

scores.map! do |score|
  score == 'X' ? 10 : score.to_i
end

i = 0
frames = 10
result = 0

(1..frames).each do |frame|
  if frame == 10
    (i..scores_length).each do |i|
      result += scores[i]
    end
  elsif scores[i] == 10
    result += 10 + scores[i + 1] + scores[i + 2]
    i += 1
  elsif scores[i] + scores[i + 1] == 10
    result += 10 + scores[i + 2]
    i += 2
  else
    result += scores[i] + scores[i + 1]
    i += 2
  end
end

puts result
