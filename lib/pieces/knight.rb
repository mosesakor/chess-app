# frozen_string_literal: true

# This class is the Knight Piece
class Knight
  attr_reader :start, :possible_moves

  def initialize(start)
    # start is starting position as array
    @start = start
    @possible_moves = moves(start)
  end

  def moves(arr)
    new_arr = [[-2, -1], [-2, 1], [-1, 2], [1, 2], [2, 1], [2, -1], [1, -2], [-1, -2]]
    possible = new_arr.map do |num1, num2|
      [arr[0] + num1, arr[1] + num2]
    end
    possible.reject { |x, y| invalid?(x, y) }
  end

  def invalid?(var1, var2)
    var1.negative? || var1 > 7 || var2.negative? || var2 > 7
  end
end

# p Knight.new([0, 0]).moves([0, 0])
