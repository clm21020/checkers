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
    # system("clear")
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

  def remove_piece_at(pos)
    self[pos] = nil
  end
end
