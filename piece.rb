require 'colorize'

class Piece
  attr_reader :color
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

      options << [row, col] if row.between?(0, 7) && col.between?(0, 7)
    end

    options
  end

  def jump_moves

  end

  def perform_slide(end_pos)
    ##########################################################################
    if slide_options.include?(end_pos)
      @board.move(pos, end_pos)
    end

    # Write method perform_slide to perform a single move.
    # An illegal slide/jump should return false; else true.
  end

  def perform_move(end_pos)
    # Write method perform_jump to perform a single move.
    # perform_jump should remove the jumped piece from the Board
    # An illegal slide/jump should return false; else true.
  end

  def move_sequence

  end
end



# b = Board.new

# #Testing Movement
# bp = Piece.new(:black, [0,0])
# #p bp
# puts "black pawn move dirs: #{bp.move_dirs == [[1, 1], [1, -1]]}"
# puts "black pawn slide options: #{bp.slide_options == [[1, 1]]}"
#
# bk = Piece.new(:black, [1, 1], true)
# p bk
# puts "black king move dirs: #{bk.move_dirs == [[1, 1], [1, -1], [-1, 1], [-1, -1]]}"
# puts "black king slide options: #{bk.slide_options == [[2, 2], [2, 0], [0, 2], [0, 0]]}"
#
# rp = Piece.new(:red, [7, 7])
# p rp
# puts "red pawn move dirs: #{rp.move_dirs == [[-1, 1], [-1, -1]]}"
# puts "red pawn slide options: #{rp.slide_options == [[6, 6]]}"
#
# rk = Piece.new(:red, [6, 6], true)
# # p rk
# puts "red king move dirs: #{rk.move_dirs == [[-1, 1], [-1, -1], [1, 1], [1, -1]]}"
# puts "red king slide options: #{rk.slide_options == [[5, 7], [5, 5], [7, 7], [7, 5]]}"



# #Testing king_me
# bp2 = Piece.new(:black, [0,2])
# rp2 = Piece.new(:red, [7, 5])
# puts !bp2.king?
# puts !rp2.king?
#
# bp2.king_me
# rp2.king_me
#
# puts bp2.king?
# puts rp2.king?



# bk2.king




# puts "test".colorize(:green)


# ✓A non-king Piece can move forward only;
# ✓kings can move backward and forward.
#
# ✓We probably don't need a PawnPiece and KingPiece;
# just "promote" a Piece to king when it hits the opposite row by setting an ivar.
#
# Write methods perform_slide and perform_jump to perform a single move.
# An illegal slide/jump should return false; else true.
#
# ✓I wrote a helper method #move_diffs which returned the directions a piece could move in.
#
# perform_jump should remove the jumped piece from the Board.
#
# Make sure to possibly promote after each move;
# I wrote a method #maybe_promote which checked to see if the piece reached the back row.
#
# I think that perform_slide/perform_jump make sense to put in the Piece because they're things the piece does. Also, the Piece is the one that knows its color/whether it's a king, so the Piece is the best able to say which direction it is allowed to move in.
# Once you get perform_slide and perform_jump working, call over your TA and have them take a look.
