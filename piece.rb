require 'colorize'

class Piece
  attr_reader :color, :board
  attr_accessor :pos

  def initialize(color, pos, board, king = false)
    @color = color
    @pos = pos
    @king = king
    @board = board
  end

  def king?
    @king
  end

  def king_me
    @king = true
  end

  def move_dirs
    row_dirs = { black: 1, red: -1 }
    pawn_dirs =  [[row_dirs[color], 1],
                     [row_dirs[color], -1]]
    king_dirs =  [[row_dirs[color] * -1, 1],
                     [row_dirs[color] * -1, -1]]

    king? ? pawn_dirs + king_dirs : pawn_dirs
  end

  def slide_options
    options = []

    move_dirs.each do |dir|
      row = dir[0] + pos[0]
      col = dir[1] + pos[1]

      options << [row, col] if row.between?(0, 7) &&
                               col.between?(0, 7) &&
                               @board[[row, col]].nil?
    end

    options
  end

  def perform_slide(end_pos)
    !!if slide_options.include?(end_pos)
      @board.move(pos, end_pos)
    end

  # Write method perform_slide to perform a single move.
  # An illegal slide/jump should return false; else true.
  end

  def jump_options
    options = []

    move_dirs.each do |dir|
      row1 = dir[0] + pos[0]
      col1 = dir[1] + pos[1]

      row2 = (dir[0] * 2) + pos[0]
      col2 = (dir[1] * 2) + pos[1]

      options << [row2, col2] if row2.between?(0, 7) &&
                                 col2.between?(0, 7) &&
                                 @board[[row2, col2]].nil? &&
                                 !@board[[row1, col1]].nil? &&
                                 @board[[row1, col1]].color != color
    end

    options
  end

  def jumped_pos(end_pos)
    row = (pos[0] + end_pos[0]) / 2
    col = (pos[1] + end_pos[1]) / 2
    [row, col]
  end

  def perform_jump(end_pos)
    !!if jump_options.include?(end_pos)
      @board.remove_piece_at(jumped_pos(end_pos))
      @board.move(pos, end_pos)
    end
  end

  def move_sequence

  end
end



# ✓A non-king Piece can move forward only;
# ✓kings can move backward and forward.
#
# ✓We probably don't need a PawnPiece and KingPiece;
# just "promote" a Piece to king when it hits the opposite row by setting an ivar.
#
# Make sure to possibly promote after each move;
# I wrote a method #maybe_promote which checked to see if the piece reached the back row.
#
# ✓Write methods perform_slide and perform_jump to perform a single move.
# ✓An illegal slide/jump should return false; else true.
#
# ✓I wrote a helper method #move_diffs which returned the directions a piece could move in.
#
# ✓perform_jump should remove the jumped piece from the Board.
#
# Once you get perform_slide and perform_jump working, call over your TA and have them take a look.
