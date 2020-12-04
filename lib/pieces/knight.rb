# frozen_string_literal: true

# This class is the Knight Piece
class Knight
  attr_reader :start, :possible_moves

  def initialize(start)
    # start is starting position as array
    @start = start
    @possible_moves = nil
  end

  def invalid?(var1, var2)
    var1.negative? || var1 > 7 || var2.negative? || var2 > 7
  end
end
