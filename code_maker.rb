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
        if guess == @secret_code
            return "You did it!"
        elsif guess != @secret_code
            # return the elements in each array that match color & position
            guess.each_with_index do |element, index| 
                if element == @secret_code[index]
                    captured_elements.push(element)
                    correct_color_and_position += 1
                end
            end
            guess.each_with_index do |element, index|    
                if element != @secret_code[index] && @secret_code.include?(element) && !captured_elements.include?(element) 
                    captured_elements.push(element)
                    correct_color += 1                
                end
            end
        end
        p "On fire: #{correct_color_and_position}, Warm: #{correct_color}"
    end
end