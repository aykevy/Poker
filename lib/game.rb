require_relative "deck"

class Game

    attr_accessor :deck

    def initialize
        @deck = Deck.new
    end

end