# frozen_string_literal: true

require_relative 'shot'

class Frame
  attr_reader :shots

  def initialize(frame_number, first_shot, second_shot = nil, third_shot = nil)
    @frame_number = frame_number
    @shots = [first_shot]
    @shots << second_shot unless second_shot.nil?
    @shots << third_shot unless third_shot.nil?
  end

  def calc_score(frames)
    result = shots.sum(&:score)
    if @frame_number < 9
      if strike?
        result += calc_strike_bonus(frames)
      elsif spare?
        result += calc_spare_bonus(frames)
      end
    end
    result
  end

  protected

  def strike?
    shots[0].score == 10
  end

  def spare?
    !strike? && shots.first(2).sum(&:score) == 10
  end

  def calc_strike_bonus(frames)
    next_frame_index = @frame_number + 1
    next_frame = frames[next_frame_index]
    if next_frame.strike?
      if next_frame_index == 9
        10 + next_frame.shots[1].score
      else
        10 + frames[next_frame_index + 1].shots[0].score
      end
    else
      next_frame.shots.first(2).sum(&:score)
    end
  end

  def calc_spare_bonus(frames)
    frames[@frame_number + 1].shots[0].score
  end
end
