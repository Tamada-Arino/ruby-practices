# frozen_string_literal: true

require_relative 'frame'

class Game
  def initialize(scores)
    i = 0
    @frames = []
    (1..10).each do |frame|
      if frame == 10
        @frames << Frame.new(scores[i], scores[i + 1], scores[i + 2])
      elsif scores[i] == 'X'
        @frames << Frame.new('X', 0)
        i += 1
      else
        @frames << Frame.new(scores[i], scores[i + 1])
        i += 2
      end
    end
  end

  def result_score
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
    if @frames[next_frame_index].strike? && next_frame_index == 8
      10 + @frames[next_frame_index].second_shot.score
    elsif @frames[next_frame_index].strike?
      10 + @frames[next_frame_index + 1].first_shot.score
    else
      @frames[next_frame_index].first_shot.score + @frames[next_frame_index].second_shot.score
    end
  end

  def spare_score_bonus(next_frame_index)
    @frames[next_frame_index].first_shot.score
  end
end
