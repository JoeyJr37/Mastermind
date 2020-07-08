class CodeMaker
    attr_accessor :secret_code
    def initialize
        @secret_code = []
    end
    # set numbers to specific colors
    def determine_secret_code(numerical_code)
        case numerical_code
        when 0
            "Red"
        when 1
            "Blue"
        when 2
            "Yellow"
        when 3
            "Green"
        when 4
            "Purple"
        when 5
            "Maroon"
        else
            nil 
        end
    end

    # generate secret code
    def generate_secret_code
        4.times{ @secret_code.push(determine_secret_code(rand(6)))}
        @secret_code
    end

    #compare received guesses to secret code
    def compare_guess_to_secret_code(guess)
        correct_color_and_position = 0
        correct_color = 0
        captured_elements = []
        secret_code_copy = []
        guess_copy = []
        if guess == @secret_code
            return "You did it!"
        elsif guess != @secret_code
            # return the elements in each array that match color & position
            guess.each_with_index do |element, index| 
                if element == @secret_code[index]
                    correct_color_and_position += 1
                else
                    secret_code_copy.push(@secret_code[index])
                    guess_copy.push(element)
                end
            end
            secret_code_copy.each_with_index do |element, index|
                # if the guessed color is in the secret_code +1 for correct color
                # if the secret code contains the same element multiple times, 
                    # and the guess contains the same element multiple times,
                    # then +x for correct color where x is how many times the element appears in both cases    
                if guess_copy.include?(element)
                    correct_color += 1                
                end
            end
        end
        p "On fire: #{correct_color_and_position}, Warm: #{correct_color}"
    end
end