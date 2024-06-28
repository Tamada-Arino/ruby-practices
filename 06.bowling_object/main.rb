# frozen_string_literal: true

require_relative 'game'

marks = ARGV[0].chomp.split(',')
game = Game.new(marks)
puts game.calc_result
