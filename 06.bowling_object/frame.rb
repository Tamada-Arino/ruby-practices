# frozen_string_literal: true

require_relative 'shot'

class Frame
  attr_reader :shots

  def initialize(first_shot, second_shot, third_shot = nil)
    @shots= []
    @shots << Shot.new(first_shot)
    @shots << Shot.new(second_shot)
    @shots << Shot.new(third_shot)
  end

  def strike?
    shots[0].score == 10
  end

  def spare?
    !strike? && shots[0].score + shots[1].score == 10
  end

  def frame_score
    shots[0].score + shots[1].score + shots[2].score
  end
end
