require_relative './code_maker'
require_relative './code_breaker'

class Game
    def initialize
        @code_maker = CodeMaker.new
        @code_breaker = CodeBreaker.new
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

    def computer_is_mastermind
        puts "A randomly selected secret code is being generated."
        secret_code = @code_maker.generate_secret_code
        guess = receive_guess
        response = @code_maker.compare_guess_to_secret_code(guess)
        until response == "You did it!" || @code_breaker.game_over?
            @code_breaker.used_a_turn()
            guess = receive_guess
            response = @code_maker.compare_guess_to_secret_code(guess)
        end
        if @code_breaker.game_over?
            puts "Maybe next time! The secret code was #{secret_code}"
        else
            puts "You did it! The secret code was #{secret_code}"
        end
    end

    def start_new_game
        puts 'Welcome to Mastermind! What is your name?'
        name = gets.chomp
        puts "Greetings #{name.capitalize!}! Would you like to be the 'Mastermind' or the 'Decoder'?"
        user = gets.chomp
        if user.capitalize == 'Mastermind'
            user_is_mastermind
        elsif user.capitalize == 'Decoder'
            computer_is_mastermind
        else
            puts "I don't understand. You'll have to try again!"
        end
    end

    def user_creates_code
        # user creates code
        puts "Please enter four colors separated by a comma(choices are red, blue, green, purple, yellow, maroon):"
        user_input = gets.chomp
        secret_code = user_input.split(", ").map { |element| element.capitalize }
        colors = ["Red", "Blue", "Yellow", "Green", "Purple", "Maroon"]
        validate_secret_code = secret_code.filter do |element| 
            !colors.include?(element)
        end
        # if the secret code includes something other than the original colors, throw an exception
        if validate_secret_code.empty? == false
            p validate_secret_code
            puts "Your code was invalid. Please try again."
            user_creates_code
        else
            secret_code
        end
    end

    def computer_is_decoder(secret_code)
        # computer guesses code
        computer_guess = @code_maker.generate_secret_code
        p "My guess is: #{computer_guess}"
        until computer_guess == secret_code || @code_breaker.game_over?
            @code_breaker.used_a_turn
            computer_is_decoder(secret_code)
        end
    end
    def computer_trying_to_crack_code
        #some cool code here
        
    end
    def user_is_mastermind
        secret_code = user_creates_code
        computer_is_decoder(secret_code)
    end
end

new_game = Game.new
new_game.start_new_game