require_relative 'board'

def test_jumps
  b = Board.new(false)
  bp = Piece.new(:black, [1,1], b)
  rp = Piece.new(:red, [2,2], b)
  bk = Piece.new(:black, [2,0], b, true)
  b[[1,1]] = bp
  b[[2,2]] = rp
  b[[2,0]] = bk
  b.display
  puts "Press enter to see jump_options"
  gets

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
end

def test_slides
  b = Board.new(false)
  bp = Piece.new(:black, [1,1], b)
  rp = Piece.new(:red, [2,2], b)
  bk = Piece.new(:black, [2,0], b, true)
  b[[1,1]] = bp
  b[[2,2]] = rp
  b[[2,0]] = bk
  b.display
  puts "Press enter to see slide_options"
  gets

  p "bp.slide_options == []: #{bp.slide_options == []}"
  p "rp.slide_options == [[1, 3]]: #{rp.slide_options == [[1, 3]]}"
  p "bk.slide_options == [[3, 1]]: #{bk.slide_options == [[3, 1]]}"

  puts "Press enter to perform slide"
  gets

  p "bp.perform_slide([2, 2]) == false: #{bp.perform_slide([2, 2]) == false}"
  p "rp.pos == [2, 2]: #{rp.pos == [2, 2]}"
  p "rp.perform_slide([1, 3]): #{rp.perform_slide([1, 3])}"
  p "rp.pos == [1,3]: #{rp.pos == [1,3]}"

  p "bk.perform_slide([3, 1]): #{bk.perform_slide([3, 1])}"

  b.display
end

def show_board_initial_display
  b = Board.new
  b.display
end

def test_promotion
  b = Board.new(false)
  bp = Piece.new(:black, [5,1], b)
  rp = Piece.new(:red, [2,6], b)
  b[[5,1]] = bp
  b[[2,6]] = rp

  b.display

  puts "!bp.king? #{!bp.king?}"
  puts "!rp.king? #{!rp.king?}"

  puts "Press enter to still see pawns"
  gets

  bp.perform_slide([6,0])
  rp.perform_slide([1,7])

  b.display

  puts "!bp.king? #{!bp.king?}"
  puts "!rp.king? #{!rp.king?}"

  puts "Press enter to see kings"
  gets

  bp.perform_slide([7,1])
  rp.perform_slide([0,6])

  b.display
  puts "bp.king? #{bp.king?}"
  puts "rp.king? #{rp.king?}"
end


#test_promotion
#test_jumps
test_slides
#show_board_initial_display


  #------------------------------------------


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
