require_relative "deck"

class Game

    attr_accessor :deck

    def initialize
        @deck = Deck.new
    end

    #Rank 10 No Pair / High Card (No matches)
    def no_pair
    end

    #Rank 9 One Pair (One pair of same rank cards regardless of suit)
    def one_pair
    end

    #Rank 8 Two Pair (Two pairs of same rank cards regardless of suit)
    def two_pair
    end

    #Rank 7 Three of a Kind (Three cards of same rank regardless of suit)
    def three_of_a_kind
    end

    #Rank 6 Straight (Consecutive Numbers regardless of suit)
    def straight
    end

    #Rank 5 Flush (All 5 cards are of same suit)
    def flush
    end

    #Rank 4 Full House (3 cards of same rank + 2 cards of same rank)
    def full_house
    end

    #Rank 3 Four of a Kind (Four cards of same rank regardless of suit)
    def four_of_a_kind
    end

    #Rank 2 Straight Flush (All 5 cards are of same suit and consecutive ranks)
    def straight_flush
    end

    #Rank 1 Royal Flush (All 5 cards are of same suit and K, Q, J, A, J)
    def royal_flush
    end

end