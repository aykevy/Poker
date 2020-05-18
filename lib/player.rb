require_relative "hand"

class Player

    attr_accessor :hand, :pot
    
    def initialize
        @hand = Hand.new
        @pot = 1200 #Stimulus check baby.
    end

    def discard_amount_prompt
        allowed_discards = (1..3).to_a
        while true
            puts "Please enter the amount to discard: "
            get_disc = gets.chomp.to_i
            return get_disc if allowed_discards.include?(get_disc)
        end
    end

    def discard_which_prompt(amount)
        suffixes = ["st", "nd", "rd"]
        suits = { "spade" => "♠", "heart" => "♥", "diamond" => "♦", "clover" => "♣" }
        to_discard = []

        while true
            amount.times do | num |
                puts "Choose your #{num + 1}#{suffixes[num]} card of choice to discard"
                puts "Format should be heart/spade/diamond/clover followed by space and rank"
                get_targets = gets.chomp.split(" ")
                if get_targets.length == 2
                    t_suit, t_rank = get_targets
                    suit = suits[t_suit]
                    rank = t_rank.to_i
                    if @hand.any? { | card | card.suit == suit && card.rank == rank }
                        to_discard << [suit, rank] unless to_discard.include?([suit, rank])
                    end
                end
            end
            
            if to_discard.length == amount
                puts "Success! The following will be discarded: #{to_discard}"
                return to_discard
            end
            to_discard = []
        end
    end

    def discard(arr)
        new_set = @hand.select { | card | arr.include?(card.rank) }
        @hand = new_set
    end

    def fold
    end

    def see
    end

    def raise
    end

    def action
        discard(discard_which_prompt(discard_amount_prompt))
    end

end

if __FILE__ == $PROGRAM_NAME
    h = Hand.new
    h.cards = [Card.new("♠", 7), Card.new("♥", 7), Card.new("♠", 8), Card.new("♥", 2), Card.new("♠", 3)]

    my_player = Player.new
    my_player.hand = h
    my_player.discard_which_prompt(my_player.discard_amount_prompt)

    

end