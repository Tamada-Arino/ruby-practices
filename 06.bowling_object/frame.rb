# frozen_string_literal: true

require_relative 'shot'

class Frame
  attr_reader :shots

  def initialize(frame_number, first_shot, second_shot, third_shot = nil)
    @shots= []
    @shots << frame_number
    @shots << Shot.new(first_shot)
    @shots << Shot.new(second_shot)
    @shots << Shot.new(third_shot)
  end

  def strike?
    shots[1].score == 10
  end

  def spare?
    !strike? && shots[1].score + shots[2].score == 10
  end

  def frame_score
    shots[1].score + shots[2].score + shots[3].score
  end
end
