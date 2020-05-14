class Hand

    attr_accessor :cards

    def initialize
        @cards = Array.new
    end

    #Converts the cards you own into a hash.
    def hand_hash
        h = Hash.new { | hash, k | hash[k] = Array.new }
        @cards.each { | card | h[card.rank] << card.suit }
        h
    end

    #Rank 9 One Pair (One pair of same rank cards regardless of suit)
    def one_pair?(h)
        h.values.one? { | sub_arr | sub_arr.length == 2 }
    end

    #Rank 8 Two Pair (Two pairs of same rank cards regardless of suit)
    def two_pair?(h)
        h.values.count { | sub_arr | sub_arr.length == 2 } == 2
    end

    #Rank 7 Three of a Kind (Three cards of same rank regardless of suit)
    def three_of_a_kind?(h)
        h.values.one? { | sub_arr | sub_arr.length == 3 }
    end

    #Rank 6 Straight (Consecutive Numbers regardless of suit)
    def straight?(h)
        return false if h.keys.length != 5
        sorted_ranks = h.keys.sort
        sorted_ranks.each_with_index do | rank, idx |
            if idx != 0
                return false if rank != sorted_ranks[idx - 1] + 1
            end
        end
        true
    end

    #Rank 5 Flush (All 5 cards are of same suit)
    def flush?(h)
        suits = h.values.flatten
        suits.all? { | suit | suit == suits.first }
    end

    #Rank 4 Full House (3 cards of same rank + 2 cards of same rank)
    def full_house?(h)
        one_pair?(h) && three_of_a_kind?(h)
    end

    #Rank 3 Four of a Kind (Four cards of same rank regardless of suit)
    def four_of_a_kind?(h)
        h.values.one? { | sub_arr | sub_arr.length == 4 }
    end

    #Rank 2 Straight Flush (All 5 cards are of same suit and consecutive ranks)
    def straight_flush?(h)
        straight?(h) && flush?(h)
    end

    #Rank 1 Royal Flush (All 5 cards are of same suit and A, 10, J, Q, K)
    def royal_flush?(h)
        royal = [1, 10, 11, 12, 13]
        flush?(h) && royal.all? { | suit | h.keys.include?(suit) }
    end

    #Returns the hand score given the hand.
    def hand_score
        #Check if the hand is of any of the following variations.
        h = hand_hash
        return 1 if royal_flush?(h)
        return 2 if straight_flush?(h)
        return 3 if four_of_a_kind?(h)
        return 4 if full_house?(h)
        return 5 if flush?(h)
        return 6 if straight?(h)
        return 7 if three_of_a_kind?(h)
        return 8 if two_pair?(h)
        return 9 if one_pair?(h)
        #By default return 10 if you have none of the above.
        10
    end

end