# frozen_string_literal: true

class Shot
  attr_reader :shot

  def initialize(mark)
    @mark = mark
  end

  def score
    mark == 'X' ? 10 : mark.to_i
  end

  def strike?
    mark == 'X'
  end
end
