class Game
  def initialize(scores)
    scores_length = scores.length - 1
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
end
