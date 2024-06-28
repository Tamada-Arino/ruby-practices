# frozen_string_literal: true

require_relative 'frame'

class Game
  def initialize(scores)
    score_index = 0
    @frames = []
    (1..10).each do |frame|
      if frame == 10
        @frames << Frame.new(frame, scores[score_index], scores[score_index + 1], scores[score_index + 2])
      elsif scores[score_index] == 'X'
        @frames << Frame.new(frame, 'X', 0)
        score_index += 1
      else
        @frames << Frame.new(frame, scores[score_index], scores[score_index + 1])
        score_index += 2
      end
    end
  end

  def calc_result
    result = 0
    @frames.each.with_index do |frame, i|
      result += frame.frame_score
      if i < 9
        if frame.strike?
          result += strike_score_bonus(i + 1)
        elsif frame.spare?
          result += spare_score_bonus(i + 1)
        end
      end
    end
    result
  end

  private

  def strike_score_bonus(next_frame_index)
    if @frames[next_frame_index].strike? && next_frame_index == 9
      10 + @frames[next_frame_index].shots[2].score
    elsif @frames[next_frame_index].strike?
      10 + @frames[next_frame_index + 1].shots[1].score
    else
      @frames[next_frame_index].shots[1].score + @frames[next_frame_index].shots[2].score
    end
  end

  def spare_score_bonus(next_frame_index)
    @frames[next_frame_index].shots[1].score
  end
end
