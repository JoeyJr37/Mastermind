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

    def receive_guesses
        # until @code_breaker.game_over? == true
            puts 'Please enter four colors(separated by a comma): '
            guess = gets.chomp
            # turn user guess into an array
            user_array = guess.split(", ")
            # map user array to match style of code_maker array
            formatted_guess = user_array.map { |element| element.capitalize}
            p formatted_guess
    end
end

new_game = Game.new
new_game.start_new_game
new_game.receive_guesses