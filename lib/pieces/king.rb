# frozen_string_literal: true

# This is the King Class
class King
  attr_reader :position, :color, :possible_moves

  def initialize(start, color)
    # start is starting position of piece on board as array
    @position = start
    @color = color
    @possible_moves = moves(start)
  end

  def moves(arr)
    new_arr = [[-1, 0], [-1, 1], [0, 1], [1, 1], [1, 0], [1, -1], [0, -1], [-1, -1], [0, 2]]
    # king-rook exchange move included
    possible = new_arr.map do |num1, num2|
      [arr[0] + num1, arr[1] + num2]
    end
    possible.reject { |x, y| invalid?(x, y) }
  end

  def invalid?(var1, var2)
    var1.negative? || var1 > 7 || var2.negative? || var2 > 7
  end
end

# p King.new([0, 4], 'black').possible_moves
