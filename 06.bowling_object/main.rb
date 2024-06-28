# frozen_string_literal: true

require_relative 'game'

shots = ARGV[0].chomp.split(',')
game = Game.new(shots)
puts game.calc_result
