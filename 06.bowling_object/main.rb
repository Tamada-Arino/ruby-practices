# frozen_string_literal: true

require_relative 'game'

scores = ARGV[0].chomp.split(',')
game = Game.new(scores)
puts game.calc_result
