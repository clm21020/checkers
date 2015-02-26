class Board
  def initialize
    @grid = Array.new(8) { Array.new(8) }
  end

  def setup
    
  end

  def display
    @grid.each do |row|
      pieces = []

      row.each do |piece|
        pieces << (piece.nil? ? "   " : " #{piece} ")
      end

      p pieces.join("|")
    end
  end

  def[](pos)
    @grid[pos[0]][pos[1]]
  end

  def[]=(pos, piece)
    @grid[pos[0]][pos[1]] = piece
  end

  def move

  end
end

if __FILE__ == $PROGRAM_NAME
  b = Board.new
  b.display
  gets
  pos = [0, 2]
  # b[pos] = 4
  # b.display
end
