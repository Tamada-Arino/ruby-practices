# frozen_string_literal: true

class Shot
  attr_reader :shot

  def initialize(shot)
    @shot = shot
  end

  def score
    shot == 'X' ? 10 : shot.to_i
  end
end
