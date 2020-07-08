class CodeBreaker

    def initialize
        @turns_left = 12
    end

    def used_a_turn
        @turns_left -= 1
        p "#{@turns_left} turns left..."
    end

    def game_over?
        if @turns_left == 0
            true 
        else
            false
        end
    end
end