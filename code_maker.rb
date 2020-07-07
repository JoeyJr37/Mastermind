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
            "Green"
        when 3
            "Yellow"
        when 4
            "Green"
        when 5
            "Purple"
        else
            nil 
        end
    end

    # generate secret code
    def generate_secret_code
        4.times{ @secret_code.push(determine_secret_code(rand(6)))}
        @secret_code
    end
end