require_relative "deck"

class Game

    attr_accessor :deck, :turn, :pot

    def self.get_players
        return Array.new
    end

    def initialize
        @deck = Deck.new
        @player_list = Game.get_players
        @turn = @player_list.first
        @pot = 0
    end

end