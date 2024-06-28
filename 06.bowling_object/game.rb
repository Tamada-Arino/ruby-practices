# frozen_string_literal: true

require_relative 'frame'

class Game
  def initialize(shots)
    game = []
    shots.each do |shot|
      game << Shot.new(shot)
    end

    shots_index = 0
    @frames = []
    (1..10).each do |frame_number|
      if frame_number == 10
        @frames << Frame.new(frame_number, *game[shots_index, 3])
      elsif game[shots_index].strike?
        @frames << Frame.new(frame_number, game[shots_index])
        shots_index += 1
      else
        @frames << Frame.new(frame_number, *game[shots_index, 2])
        shots_index += 2
      end
    end
  end

  def calc_result
    @frames.sum do |frame|
      frame.calc_score(@frames)
    end
  end
end
