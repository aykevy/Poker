require_relative "card"

class Deck

    attr_accessor :deck

    def self.new_deck
        deck = Array.new
        suits = ["♠", "♥", "♦", "♣"]
        (1..13).each do | rank |
            (0..3).each { | index | deck << Card.new(suits[index], rank) }
        end
        deck.shuffle!
        deck
    end

    def initialize
        @deck = Deck.new_deck
    end

    def print_deck
        @deck.each do | card |
            puts "#{card.suit} -> #{card.rank}"
        end
    end

end