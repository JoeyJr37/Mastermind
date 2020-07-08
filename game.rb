require_relative './code_maker'
require_relative './code_breaker'

class Game
    def initialize
        @code_maker = CodeMaker.new
        @code_breaker = CodeBreaker.new
    end

    def start_new_game
        puts 'Welcome to Mastermind! What is your name?'
        name = gets.chomp
        puts "Greetings #{name.capitalize!}! A randomly selected secret code is being generated."
        p @code_maker.generate_secret_code
    end

    def receive_guess
            puts "Please enter four colors(separated by a comma)[enter 'o' for options]: "
            guess = gets.chomp
            if guess == 'o'
                puts "Your options are red, blue, yellow, green, purple or maroon."
                receive_guess
            else
                # turn user guess into an array
                user_array = guess.split(", ")
                # map user array to match style of code_maker array
                formatted_guess = user_array.map { |element| element.capitalize}
                formatted_guess
            end
    end

    def compare_guess_to_secret_code
        guess = receive_guess
        response = @code_maker.compare_guess_to_secret_code(guess)
        until response == "You did it!" || @code_breaker.game_over?
            @code_breaker.used_a_turn()
            guess = receive_guess
            response = @code_maker.compare_guess_to_secret_code(guess)
        end
        p "You did it!"
    end
end

new_game = Game.new
new_game.start_new_game
new_game.compare_guess_to_secret_code