# frozen_string_literal: true

require_relative 'frame'

class Game
  def initialize(marks)
    shots = marks.map { |mark| Shot.new(mark) }

    shots_index = 0
    @frames = []
    0.upto(9).each do |frame_number|
      length =
        if frame_number == 9
          3
        elsif shots[shots_index].strike?
          1
        else
          2
        end
      @frames << Frame.new(frame_number, *shots[shots_index, length])
      shots_index += length
    end
  end

  def calc_result
    @frames.sum do |frame|
      frame.calc_score(@frames)
    end
  end
end
