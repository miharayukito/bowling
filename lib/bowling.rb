class Bowling
    def initialize
        @total_score = 0
    end

    def total_score
        @total_score
    end

    def add_score(pins)
        @total_score += pins
    end
end

# @game = Bowling.new

# 20.times do
#     @game.add_score(1)
# end

# puts @game.total_score == 20
