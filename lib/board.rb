require 'colorize'

class Board
  attr_accessor :grid

  def initialize
    @grid = Array.new(8) { Array.new(8, nil) }
  end
  
  def set_pieces
    set_pawns
    set_white_pieces
    set_black_pieces
  end

  def set_pawns
    set_white_pawns
    set_black_pawns
  end

  def set_white_pawns
    0.upto(7) do |i|
      @grid[6][i] = Pawn.new([6, i], true)
    end
  end

  def set_black_pawns
    0.upto(7) do |i|
      @grid[1][i] = Pawn.new([1, x], false)
    end
  end

  def set_white_pieces
    @grid[7][0] = Rook.new([7, 0], 'white')
    @grid[7][1] = Knight.new([7, 1], 'white')
    @grid[7][2] = Bishop.new([7, 2], 'white')
    @grid[7][3] = Queen.new([7, 3], 'white')
    @grid[7][4] = King.new([7, 4], 'white')
    @grid[7][5] = Bishop.new([7, 5], 'white')
    @grid[7][6] = Knight.new([7, 6], 'white')
    @grid[7][7] = Rook.new([7, 7], 'white')
  end

  def set_black_pieces
    @grid[0][0] = Rook.new([0, 0], 'black')
    @grid[0][1] = Knight.new([0, 1], 'black')
    @grid[0][2] = Bishop.new([0, 2], 'black')
    @grid[0][3] = Queen.new([0, 3], 'black')
    @grid[0][4] = King.new([0, 4], 'black')
    @grid[0][5] = Bishop.new([0, 5], 'black')
    @grid[0][6] = Knight.new([0, 6], 'black')
    @grid[0][7] = Rook.new([0, 7], 'black')
  end


  def render
    system('clear')
    print ("   " + ('a'..'h').to_a.join(" ") + "\n")
    self.grid.each_with_index do |row, i|
      print "#{i + 1} "
      row.each_with_index do |space, j|
        if (i + j).odd?
          background = :light_black
        else
          background = :light_blue
        end
        if space.nil?
          print '  '.colorize(:background => background)
        else
          print "#{space.symbol} ".colorize(:color => space.color,
            :background => background)
        end
      end
      print " #{i + 1}"
      puts
    end
    print ("  " + ('a'..'h').to_a.join(" ") + "\n")
  end

end

a = Board.new.render