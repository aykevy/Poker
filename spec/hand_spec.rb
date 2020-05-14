require "hand"
require "card"

describe Hand do

    subject(:hand) { Hand.new }

    describe "#one_pair?" do
        it "checks if theres a pair of cards" do
            hand.cards = [Card.new("♠", 7), Card.new("♥", 7), Card.new("♠", 8), Card.new("♥", 2), Card.new("♠", 3)]
            expect(hand.one_pair?(hand.hand_hash)).to eq(true)
        end
    end

    describe "#two_pair?" do
        it "checks if theres two pairs of same cards" do
            hand.cards = [Card.new("♠", 7), Card.new("♥", 7), Card.new("♠", 8), Card.new("♥", 8), Card.new("♠", 3)]
            expect(hand.two_pair?(hand.hand_hash)).to eq(true)
        end
    end

    describe "#three_of_a_kind?" do
        it "checks if theres three cards of the same rank regardless of suit" do
            hand.cards = [Card.new("♠", 7), Card.new("♥", 7), Card.new("♠", 7), Card.new("♥", 8), Card.new("♠", 3)]
            expect(hand.three_of_a_kind?(hand.hand_hash)).to eq(true)
        end
    end

    describe "#straight?" do
        it "checks if all five cards are consecutive regardless of suit" do
            hand.cards = [Card.new("♠", 7), Card.new("♥", 4), Card.new("♠", 5), Card.new("♠", 6), Card.new("♠", 3)]
            expect(hand.straight?(hand.hand_hash)).to eq(true)
        end
    end

    describe "#flush?" do 
        it "checks if all five cards are of the same suit" do
            hand.cards = [Card.new("♠", 7), Card.new("♠", 7), Card.new("♠", 7), Card.new("♠", 8), Card.new("♠", 3)]
            expect(hand.flush?(hand.hand_hash)).to eq(true)
        end
    end

    describe "#full_house?" do
        it "checks if there are 3 cards of the same rank and 2 cards of the same rank" do
            hand.cards = [Card.new("♠", 7), Card.new("♥", 7), Card.new("♠", 8), Card.new("♠", 7), Card.new("♠", 8)]
            expect(hand.full_house?(hand.hand_hash)).to eq(true)
        end
    end

    describe "#four_of_a_kind?" do
        it "checks if theres four cards of the same rank regardless of suit" do
            hand.cards = [Card.new("♠", 7), Card.new("♥", 7), Card.new("♠", 7), Card.new("♥", 7), Card.new("♠", 3)]
            expect(hand.four_of_a_kind?(hand.hand_hash)).to eq(true)
        end
    end

    describe "#straight_flush?" do
        it "checks if all 5 cards are of same suit and consecutive ranks" do
            hand.cards = [Card.new("♠", 7), Card.new("♠", 8), Card.new("♠", 6), Card.new("♠", 5), Card.new("♠", 4)]
            expect(hand.straight_flush?(hand.hand_hash)).to eq(true)
        end
    end

    describe "#royal_flush?" do
        it "checks if all five cards are of the same suit and ranks are 1, 10, 11, 12, 13" do
            hand.cards = [Card.new("♠", 1), Card.new("♠", 10), Card.new("♠", 11), Card.new("♠", 12), Card.new("♠", 13)]
            expect(hand.royal_flush?(hand.hand_hash)).to eq(true)
        end
    end

end
