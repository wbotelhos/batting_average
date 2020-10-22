# frozen_string_literal: true

class BattingAverage
  def average(h, ab)
    sprintf('%.3f', h.to_f / ab)
  end
end
