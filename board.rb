require_relative 'piece'
require 'byebug'

class Board
  CHECKERS = {
    :black => "o".colorize(:black),
    :red => "o".colorize(:red)
  }

  def initialize
    @grid = Array.new(8) { Array.new(8) }
  end

  def setup

  end

  def display
    system("clear")
    @grid.each_with_index do |row, row_i|
      pieces = []

      row.each_with_index do |piece, col_i|
        background = ((row_i + col_i) % 2 == 0) ? :light_black : :white
        checker = (piece.nil? ? "   " : " #{CHECKERS[piece.color]} ")
        pieces << checker.colorize(background: background)
      end
      puts pieces.join
    end
  end

  def[](pos)
    @grid[pos[0]][pos[1]]
  end

  def[]=(pos, piece)
    @grid[pos[0]][pos[1]] = piece
  end

  # @board.move(pos, end_pos)


  def move(start_pos, end_pos)
    piece = self[start_pos]
    self[start_pos] = nil
    self[end_pos] = piece
    piece.pos = end_pos
  end
end



if __FILE__ == $PROGRAM_NAME
  b = Board.new
  bp = Piece.new(:black, [0,0], b)
  rp = Piece.new(:red, [7,7], b)
  b[[0,0]] = bp
  b[[7,7]] = rp
  b.display
  gets
  b.move([0,0], [6, 6])
  b.display
  gets
  b.move([7,7], [2, 2])
  b.display
  gets
  puts "bp.pos : #{bp.pos}"
  puts "rp.pos : #{rp.pos}"


  # pos = [0, 2]
  # b[pos] = 4
  # b.display



  # b = Board.new
  # bp = Piece.new(:black, [0,0], b)
  # b[0,0] = bp
  # b.display
  # gets
  #
  # b.move([0,0], [6, 6])
  # b.display
  #

end
