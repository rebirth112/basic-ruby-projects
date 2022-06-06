class GameInstance
    $win_conditions = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]].freeze
    $board = Array.new(10, " ")
    def initialize(player_one, symbol_one, player_two, symbol_two)
        @player_one = player_one
        @symbol_one = symbol_one
        @player_two = player_two
        @symbol_two = symbol_two
    end

    def drawboard
        puts $board[7] + "|" + $board[8] + "|" + $board[9]
        puts ("-+--+-")
        puts $board[4] + "|" + $board[5] + "|" + $board[6]
        puts ("-+--+-")
        puts $board[1] + "|" + $board[2] + "|" + $board[3]
    end
    
    def available
        $available = (1..9).select{|pos| $board[pos] == " "}
        if $available == []
            return true
        end
    end

    def winner_one
        $win_conditions.any? do |i|
            i.all? {|j| $board[j] == @symbol_one}
        end
    end

    def winner_two
        $win_conditions.any? do |i|
            i.all? {|j| $board[j] == @symbol_two}
        end
    end

    def controls
        p "7|8|9"
        p "-+-+-"
        p "4|5|6"
        p "-+-+-"
        p "1|2|3"
    end

    def turns
        p "The positions on the NUMPAD correspond to your turn. The following grid will demonstrate the controls: "
        controls
        @turn = @player_one
        until winner_one || winner_two || available do
            available
            winner_one
            winner_two
            if @turn == @player_one
                drawboard
                puts "The available moves are..."
                available
                p (1..9).select{|pos| $board[pos] == " "}
                puts "It is now #{@player_one}'s turn. Please place #{@symbol_one} on the grid."
                move = gets.chomp.to_i
                $board[move] = @symbol_one
                @turn = @player_two
            else
                drawboard
                puts "The available moves are..."
                available
                p (1..9).select{|pos| $board[pos] == " "}
                puts "It is now #{@player_two}'s turn. Please place #{@symbol_two} on the grid."
                move = gets.chomp.to_i
                $board[move] = @symbol_two
                @turn = @player_one
            end
        end
        if winner_one
            drawboard
            puts "#{@player_one} has won!"
        elsif winner_two
            drawboard
            puts "#{@player_two} has won!"
        else
            drawboard
            puts "It's a tie!"
        end
    end
end

p "Player 1: enter your name:"
p1 = gets()
p1 = p1.to_str.chomp
s1 = "O"
s1 = s1.to_str

p "Player 2: enter your name:"
p2 = gets()
p2 = p2.to_str.chomp
s2 = "X"
s2 = s2.to_str


new_game = GameInstance.new(p1, s1, p2, s2).turns




