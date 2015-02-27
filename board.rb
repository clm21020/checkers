require_relative 'piece'
require 'byebug'

class Board
  CHECKERS = {
    "black_pawn" => " o ".colorize(:black),
    "red_pawn" => " o ".colorize(:red),
    "black_king" => " k ".colorize(:black),
    "red_king" => " k ".colorize(:red),
    "nil" => "   "
  }

  def initialize(real_game = true)
    @grid = Array.new(8) { Array.new(8) }
    add_pieces if real_game
  end

  def add_pieces
    add_team(:black)
    add_team(:red)
  end

  def add_team(color)
    rows = color == :black ? (0..2) : (5..7)
    rows.each do |row|
      8.times do |col|
        self[[row, col]] = Piece.new(color, [row, col], self) if ((row + col) % 2 == 0)
      end
    end
  end

  def display
    # system("clear")
    @grid.each_with_index do |row, row_i|
      pieces = []

      row.each_with_index do |piece, col_i|
        background = ((row_i + col_i) % 2 == 0) ? :light_black : :white
        if piece.nil?
          type = "nil"
        else
          type = piece.color.to_s + (piece.king? ? "_king" : "_pawn")
        end
        
        pieces << CHECKERS[type].colorize(background: background)
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
    piece.promote_maybe
  end

  def remove_piece_at(pos)
    self[pos] = nil
  end
end
