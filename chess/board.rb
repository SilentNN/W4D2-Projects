require_relative "piece"
class Board
    attr_reader :grid
    def initialize
        
        @grid = Board.fill_board
        
    end

    def self.fill_board 
        grid = Array.new(8) {Array.new(8){Piece.new}}
        grid[2..5].each do |row|
            row.map! {|ele| nil}
        end
        grid
    end

    def [](pos)
        row, col = pos
        @grid[row][col]
    end

    def []=(pos, val)
        row, col = pos
        @grid[row][col] = val
    end

    def valid_move?(pos)
        pos.all? {|num| num.between?(0,7)}
    end

    def move_piece(start_pos, end_pos)
        if !self[start_pos].is_a?(Piece)
            raise "no piece there"
        elsif !valid_move?(end_pos) # TODO: fix conditional
            raise "not a valid destination"
        end
        
        self[end_pos] = self[start_pos]
        self[start_pos] = nil 
    end

    

    
end

# @grid  = [
#     [:piece, :piece, :piece, :piece, :piece, :piece, :piece, :piece],
#     [:piece, :piece, :piece, :piece, :piece, :piece, :piece, :piece],
#     [:piece, :piece, :piece, :piece, :piece, :piece, :piece, :piece],
#     [:piece, :piece, :piece, :piece, :piece, :piece, :piece, :piece],
#     [:piece, :piece, :piece, :piece, :piece, :piece, :piece, :piece],
#     [:piece, :piece, :piece, :piece, :piece, :piece, :piece, :piece],
#     [:piece, :piece, :piece, :piece, :piece, :piece, :piece, :piece],
#     [:piece, :piece, :piece, :piece, :piece, :piece, :piece, :piece],
#     [:piece, :piece, :piece, :piece, :piece, :piece, :piece, :piece]
# ]