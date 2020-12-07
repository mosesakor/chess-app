# frozen_string_literal: true

# This class is the Rook Piece
class Rook
  attr_reader :position, :possible_moves, :color

  def initialize(start, color)
    # start is starting position as array
    @position = start
    @color = color
    @possible_moves = moves(start)
  end

  def moves(arr, some_arr = [])
    1.upto(7) do |i|
      some_arr << [arr[0], arr[1] + i]
      some_arr << [arr[0], arr[1] - i]
      some_arr << [arr[0] + i, arr[1]]
      some_arr << [arr[0] - i, arr[1]]
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

# p Rook.new([3, 4], 'white').possible_moves
