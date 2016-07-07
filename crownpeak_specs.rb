require_relative 'crownpeak_exercise'
require 'spec_helper'

describe CrownPeak do

  STRAIGHT_FLUSH = ['Kd','Qd','Jd','10d','9d']
  FOUR_KIND = ['Kh','Kc','Ks','Kd','2d']
  FULL_HOUSE = ['5s','5c','5d','Ks','Kh']
  FLUSH = ['Kh','Qh', '6h', '2h', '9h']
  STRAIGHT = ['Kh','Qh', 'Jd', '10h', '9h']
  THREE_KIND = ['5s','5c','5d','2s','Kh']
  TWO_PAIR = ['Ac','Ad', '6h', '6c', '9h']
  PAIR_KINGS = ['Kh','Kc','3s','6h','2d']
  PAIR_ACES = ['Ah', 'As', '10c', '7d', '6s']
  PAIR_FIVES = ['5h', '5s', '10c', '7d', '6s']
  HIGH_CARD = ['Ah', 'Ks', '10c', '7d', '6s']
  HIGH_CARD2 = ['9h', '5s', '10c', '7d', '6s']


  context "when hand is a straight flush" do

    it "should display the proper output" do
      expect { CrownPeak.evaluate_hand(STRAIGHT_FLUSH) }.to output("Straight Flush\n").to_stdout
    end

  end

  context "when hand is a four of a kind" do

    it "should display the proper output" do
      expect { CrownPeak.evaluate_hand(FOUR_KIND) }.to output("Four of a Kind\n").to_stdout
    end

  end

  context "when hand is a full house" do

    it "should display the proper output" do
      expect { CrownPeak.evaluate_hand(FULL_HOUSE) }.to output("Full House\n").to_stdout
    end

  end

  context "when hand is a flush" do

    it "should display the proper output" do
      expect { CrownPeak.evaluate_hand(FLUSH) }.to output("Flush\n").to_stdout
    end

  end

  context "when hand is a straight" do

    it "should display the proper output" do
      expect { CrownPeak.evaluate_hand(STRAIGHT) }.to output("Straight\n").to_stdout
    end

  end

  context "when hand is three of a kind" do

    it "should display the proper output" do
      expect { CrownPeak.evaluate_hand(THREE_KIND) }.to output("Three of a Kind\n").to_stdout
    end

  end

  context "when hand is two pair" do

    it "should display the proper output" do
      expect { CrownPeak.evaluate_hand(TWO_PAIR) }.to output("Two Pair\n").to_stdout
    end

  end

  context "when hand is one pair" do

    it "should display the proper output" do
      expect { CrownPeak.evaluate_hand(PAIR_KINGS) }.to output("Pair of Kings\n").to_stdout
    end

    it "should display the proper output" do
      expect { CrownPeak.evaluate_hand(PAIR_ACES) }.to output("Pair of Aces\n").to_stdout
    end

    it "should display the proper output" do
      expect { CrownPeak.evaluate_hand(PAIR_FIVES) }.to output("Pair of 5's\n").to_stdout
    end

  end

  context "when hand is high card" do

    it "should display the proper output" do
      expect { CrownPeak.evaluate_hand(HIGH_CARD) }.to output("High Card Ace\n").to_stdout
    end

    it "should display the proper output" do
      expect { CrownPeak.evaluate_hand(HIGH_CARD2) }.to output("High Card of 10\n").to_stdout
    end

  end

end
