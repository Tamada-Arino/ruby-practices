class Frame
  def initialize(first_shot, second_shot, third_shot = nil)
    @first_shot = Shot.new(first_shot)
    @second_shot = Shot.new(second_shot)
    @third_shot = Shot.new(third_shot)
  end

  def strike?
    return true if @first_shot == 'X'
    false
  end

  def spare?
    return true if @first_shot + @second_shot == 10
    false
  end
end
