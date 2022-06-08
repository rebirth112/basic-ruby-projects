class GameCodebreaker
    def initialize()
        @code_color_list = Array.new(4) { rand(1..6) }
    end

    def codemaker
        @code_color_list.map! do |i|
            if i == 1
                i = "red"
            elsif i == 2
                i = "green"
            elsif i == 3
                i = "blue"
            elsif i == 4
                i = "orange"
            elsif i == 5
                i = "yellow"
            elsif i == 6
               i = "grey"
            end
        end
    end

    def ruleset_codebreaker
        p "You are currently the codebreaker. There are four colors you must guess."
        p "Possible colors are: red, green, blue, orange, yellow, grey."
        p "The codemaker will indicate a 'CP' for correct position and color, and just 'C' for correct color in wrong position."
    end

    def gamestart
        @count = 0
        codemaker
        ruleset_codebreaker
        @codemaker_response = []
        until @count >= 12 do
            @codemaker_response = []
            @code_breaker_guess_list = []
            p "Enter your guess for the colors in order. You are currently on count #{@count + 1}."
            for i in (1..4)
                @code_breaker_guess = gets().chomp.to_str
                if @code_breaker_guess == "red" || @code_breaker_guess == "green" || @code_breaker_guess == "blue" || @code_breaker_guess == "orange" || @code_breaker_guess == "yellow" || @code_breaker_guess == "grey"
                    @code_breaker_guess_list.append(@code_breaker_guess)
                    p @code_breaker_guess_list
                else
                    p "You entered an invalid input. Try again"
                    redo
                end
            end
            puts "Your guess was:" 
            print @code_breaker_guess_list
            #exact counting
            for i in (0..3)
                if  @code_color_list[i] == @code_breaker_guess_list[i]
                    @codemaker_response.append("CP")
                elsif @code_color_list.include? @code_breaker_guess_list[i]
                    @codemaker_response.append("C")
                else
                    @codemaker_response.append('X')
                end
            end
            
            puts "The computer's response..."
            print @codemaker_response
            #print @code_color_list

            if @codemaker_response == ["CP", "CP", "CP", "CP"]
                puts "\nYou guessed correctly! Hooray!"
                break
            else
                @count+=1
            end
        end
        puts "Game Over! You lose!"
    end
end

class GameCodemaker
    $allowed_colors = ['red', 'green', 'blue', 'orange', 'yellow', 'grey'].freeze
    def initialize()
        @chosen_colors = []
    end

    def populate
        for i in (0..3)
            puts "Enter a color. Valid colors are red, green, blue, orange, yellow, grey."
            @player_choice = gets().chomp.to_str
            if $allowed_colors.include? @player_choice
                @chosen_colors.append(@player_choice)
            else
                puts "You did not enter a valid color. Try again."
                redo
            end
        end
    end

    def computer_guess
        @cpu_guess = Array.new(4) { rand(1..6) }
    end

    def computer_guess_translator
        @cpu_guess.map! do |i|
            if i == 1
                i = "red"
            elsif i == 2
                i = "green"
            elsif i == 3
                i = "blue"
            elsif i == 4
                i = "orange"
            elsif i == 5
                i = "yellow"
            elsif i == 6
               i = "grey"
            end
        end
    end

    def gameloop
        @count = 0
        initialize
        populate
        until @count > 12 do
            @codemaker_response = []
            puts 'The computer will now attempt to guess.'
            computer_guess
            computer_guess_translator
            print @cpu_guess

            for i in (0..3)
                if  @chosen_colors[i] == @cpu_guess[i]
                    @codemaker_response.append("CP")
                elsif @chosen_colors.include? @cpu_guess[i]
                    @codemaker_response.append("C")
                else
                    @codemaker_response.append('X')
                end
            end

            puts "\nYou give the following response: "
            print "\n#{@codemaker_response}"

            if @codemaker_response == ["CP", "CP", "CP", "CP"]
                puts "\nThe computer guessed correctly! You lost!"
                break
            else
                @count+=1
            end
            puts "Press enter to continue"
            worthless_variable = gets()
        end
        puts "Game Over! You won!!"
    end
end

answer = ""

until answer == "code maker" || answer == "code breaker" do
    puts "Do you want to be the code maker or the code breaker?"
    answer = gets().chomp.to_str
    puts "You did not enter a valid input"
end

if answer == "code breaker"
    new_game = GameCodebreaker.new()
    new_game.gamestart
elsif answer == "code maker"
    new_game = GameCodemaker.new()
    new_game.gameloop
end