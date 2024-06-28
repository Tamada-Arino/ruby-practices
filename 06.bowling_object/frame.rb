# frozen_string_literal: true

require_relative 'shot'

class Frame
  attr_reader :shots, :frame_number

  def initialize(frame_number, first_shot, second_shot, third_shot = nil)
    @frame_number = frame_number
    @shots= [
      Shot.new(first_shot),
      Shot.new(second_shot),
      Shot.new(third_shot)
    ]
  end

  def strike?
    shots[0].score == 10
  end

  def spare?
    !strike? && shots[0].score + shots[1].score == 10
  end

  def calc_score(frames)
    result = shots[0].score + shots[1].score + shots[2].score
    if frame_number < 10
      if strike?
        result += strike_score_bonus(frames, frame_number)
      elsif spare?
        result += spare_score_bonus(frames, frame_number)
      end
    end
    result
  end

  private

  def strike_score_bonus(frames, next_frame_index)
    if frames[next_frame_index].strike? && next_frame_index == 9
      10 + frames[next_frame_index].shots[1].score
    elsif frames[next_frame_index].strike?
      10 + frames[next_frame_index + 1].shots[0].score
    else
      frames[next_frame_index].shots[0].score + frames[next_frame_index].shots[1].score
    end
  end

  def spare_score_bonus(frames, next_frame_index)
    frames[next_frame_index].shots[0].score
  end
end
