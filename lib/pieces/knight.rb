# frozen_string_literal: true

# This class is the Knight Piece
class Knight
  attr_reader :start, :possible_moves

  def initialize(start)
    @start = start
    @possible_moves = moves(start)
  end
end
