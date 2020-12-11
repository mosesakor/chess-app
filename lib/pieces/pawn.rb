# frozen_string_literal: true

# This is Pawn Class
class Pawn
  attr_reader :position, :color, :possible_moves

  def initialize(start, color)
    # start is starting position as array
    @position = start
    @color = color
    @possible_moves = moves(start)
  end

  def invalid?(var1, var2)
    var1.negative? || var1 > 7 || var2.negative? || var2 > 7
  end

  def moves(arr)
    if color == 'white'
      new_arr = [[-1, -1], [-1, 0], [-1, 1]]
      new_arr << [-2, 0] if arr[0] == 6
    else
      new_arr = [[1, -1], [1, 0], [1, 1]]
      new_arr << [2, 0] if arr[0] == 1
    end
    possible = new_arr.map do |num1, num2|
      [arr[0] + num1, arr[1] + num2]
    end
    possible.reject { |x, y| invalid?(x, y) }
  end
end

p Pawn.new([5, 4], 'white').possible_moves
