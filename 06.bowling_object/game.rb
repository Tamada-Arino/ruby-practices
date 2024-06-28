# frozen_string_literal: true

require_relative 'frame'

class Game
  def initialize(scores)
    score_index = 0
    @frames = []
    (1..10).each do |frame_number|
      if frame_number == 10
        @frames << Frame.new(frame_number, *scores[score_index, 3])
      elsif scores[score_index].strike?
        @frames << Frame.new(frame_number, 'X')
        score_index += 1
      else
        @frames << Frame.new(frame_number, *scores[score_index, 2])
        score_index += 2
      end
    end
  end

  def calc_result
    @frames.sum do |frame|
      frame.calc_score(@frames)
    end
  end
end
