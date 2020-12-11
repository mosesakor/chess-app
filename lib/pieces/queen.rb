# frozen_string_literal: true

# This class is the Queen Piece
class Queen
  attr_reader :position, :possible_moves, :color

  def initialize(start, color)
    # start is starting position as array
    @position = start
    @color = color
    @possible_moves = moves(start)
  end

  def moves(arr, some_arr = [])
    1.upto(7) do |i|
      some_arr << [arr[0], arr[1] + i] # right
      some_arr << [arr[0], arr[1] - i] # left
      some_arr << [arr[0] + i, arr[1]] # down
      some_arr << [arr[0] - i, arr[1]] # up
      some_arr << [arr[0] - i, arr[1] + 1] # up-right
      some_arr << [arr[0] - i, arr[1] - 1] # up-left
      some_arr << [arr[0] + i, arr[1] + 1] # down-right
      some_arr << [arr[0] + i, arr[1] - 1] # down-left
    end
    some_arr.reject { |coord| invalid?(coord[0], coord[1]) }
  end

  def invalid?(var1, var2)
    var1.negative? || var1 > 7 || var2.negative? || var2 > 7
  end

  def move(arr)
    return 'Invalid Move' unless possible_moves.include?(arr)

    @position = arr
  end
end

# p Queen.new([3, 4], 'white').possible_moves
