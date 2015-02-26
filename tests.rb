require_relative 'board'

b = Board.new
bp = Piece.new(:black, [1,1], b)
rp = Piece.new(:red, [2,2], b)
bk = Piece.new(:black, [2,0], b, true)
b[[1,1]] = bp
b[[2,2]] = rp
b[[2,0]] = bk
b.display
puts "Press enter to see jump_options"
gets

# p "bp.slide_options == []: #{bp.slide_options == []}"
# p "rp.slide_options == [[1, 3]]: #{rp.slide_options == [[1, 3]]}"
# p "rp.slide_options == [[1, 3]]: #{bk.slide_options == [[3, 1]]}"

p "bp.jump_options == [[3, 3]]: #{bp.jump_options == [[3, 3]]}"
p "rp.jump_options == [[0, 0]]: #{rp.jump_options == [[0, 0]]}"
p "rp.jump_options == []: #{bk.jump_options == []}"

puts "Press enter to perform jump"
gets

p "bp.pos == [1,1]: #{bp.pos == [1,1]}"
p "bp.jumped_pos([3, 3]) == [2, 2]: #{bp.jumped_pos([3, 3]) == [2, 2]}"
p "bp.perform_jump([3, 3]): #{bp.perform_jump([3, 3])}"
p "bp.pos == [3,3]: #{bp.pos == [3,3]}"

p "rp.perform_jump([0, 0]) == false: #{rp.perform_jump([0, 0]) == false}"

b.display




  #------------------------------------------


  # #Testing Movement
  # bp = Piece.new(:black, [0,0], b)
  # #p bp
  # puts "black pawn move dirs: #{bp.move_dirs == [[1, 1], [1, -1]]}"
  # puts "black pawn slide options: #{bp.slide_options == [[1, 1]]}"
  #
  # bk = Piece.new(:black, [1, 1], b, true)
  # p bk
  # puts "black king move dirs: #{bk.move_dirs == [[1, 1], [1, -1], [-1, 1], [-1, -1]]}"
  # puts "black king slide options: #{bk.slide_options == [[2, 2], [2, 0], [0, 2], [0, 0]]}"
  #
  # rp = Piece.new(:red, [7, 7], b)
  # p rp
  # puts "red pawn move dirs: #{rp.move_dirs == [[-1, 1], [-1, -1]]}"
  # puts "red pawn slide options: #{rp.slide_options == [[6, 6]]}"
  #
  # rk = Piece.new(:red, [6, 6], b, true)
  # # p rk
  # puts "red king move dirs: #{rk.move_dirs == [[-1, 1], [-1, -1], [1, 1], [1, -1]]}"
  # puts "red king slide options: #{rk.slide_options == [[5, 7], [5, 5], [7, 7], [7, 5]]}"



  # #Testing king_me
  # bp2 = Piece.new(:black, [0,2], b)
  # rp2 = Piece.new(:red, [7, 5], b)
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
