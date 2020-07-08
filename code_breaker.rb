class CodeBreaker

    def initialize
        @turns_left = 12
    end

    def used_a_turn
        @turns_left -= 1
        puts "#{@turns_left} turns left..."
        puts "\n"
    end

    def game_over?
        if @turns_left == 0
            true 
        else
            false
        end
    end
end