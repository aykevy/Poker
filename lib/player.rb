require_relative "hand"

class Player

    attr_accessor :hand
    
    def initialize
        @hand = Hand.new
        @pot = 1200 #Stimulus check baby.
    end

    def discard
    end

    def fold
    end

    def see
    end

    def raise
    end

    def action
    end

end