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
          result += strike_score_bonus(i)
        elsif frame.spare?
          result += spare_score_bonus(i)
        end
      end
    end
    result
  end

  private

  def strike_score_bonus(i)
    if @frames[i + 1].strike? && i == 8
      10 + @frames[i + 1].second_shot.score
    elsif @frames[i + 1].strike?
      10 + @frames[i + 2].first_shot.score
    else
      @frames[i + 1].first_shot.score + @frames[i + 1].second_shot.score
    end
  end

  def spare_score_bonus(i)
    @frames[i + 1].first_shot.score
  end
end
