require 'byebug'
module CrownPeak

# Write some code that will evaluate a poker self and determine its
# rank.

# Example:
# self: Ah As 10c 7d 6s (Pair of Aces)
# self: Kh Kc 3s 3h 2d (2 Pair)
# self: Kh Qh 6h 2h 9h (Flush)

  def self.evaluate_hand(hand)
    hand_values = split_hand(hand)
    repeat_values = repeat_values(hand_values["numbers"])
    show_hand(hand_values["numbers"], hand_values["suits"], repeat_values)
  end

  def self.show_hand(number_values, suit_values, repeat_values)
    if straight_flush?(number_values, suit_values)
      puts 'Straight Flush'
    elsif four_of_a_kind?(repeat_values)
      puts 'Four of a Kind'
    elsif full_house?(repeat_values)
      puts 'Full House'
    elsif flush?(suit_values)
      puts 'Flush'
    elsif straight?(number_values)
      puts 'Straight'
    elsif three_of_a_kind?(repeat_values)
      puts 'Three of a Kind'
    elsif two_pair?(repeat_values)
      puts 'Two Pair'
    elsif one_pair?(repeat_values)
    elsif repeat_values.values.uniq.length == 1
      high_card(number_values)
    end
  end

  def self.split_hand(hand)
    mapped_numbers = []
    mapped_suits = []
    
    hand.each do |card|
      if card.length <= 2
        mapped_numbers << card[0]
        mapped_suits << card[1]
      else
        mapped_numbers << '10'
        mapped_suits << card[2]
      end
    end

    number_values = map_royals(mapped_numbers)
    sorted_mapped_numbers = number_values.map {|x| x.to_i}.sort

    {"numbers" => sorted_mapped_numbers, "suits" => mapped_suits}
  end

  def self.repeat_values(array)
    array.each_with_object(Hash.new(0)) { |array, counts| counts[array] += 1 }
  end

  def self.straight_flush?(number_values, suit_values)
    straight?(number_values) && flush?(suit_values)
  end

  def self.four_of_a_kind?(repeat_values)
    repeat_values.values.include?(4)
  end

  def self.full_house?(repeat_values)
    if repeat_values.count == 2 && three_of_a_kind?(repeat_values)
      true
    else
    end
  end

  def self.flush?(suit_values)
    suit_values.uniq.one?
  end

  def self.straight?(number_values)
    number_values == straight_values_from(number_values.first)
  end

  def self.three_of_a_kind?(repeat_values)
    repeat_values.values.include?(3)
  end

  def self.two_pair?(repeat_values)
    if repeat_values.values.count(2) >= 2
      true
    else
    end
  end

  def self.one_pair?(repeat_values)
    if repeat_values.values.include?(3)
      true
    elsif repeat_values.values.count(2) == 1
      if repeat_values.max.first == 14
        puts "Pair of Aces"
      elsif repeat_values.max.first == 13
        puts "Pair of Kings"
      elsif repeat_values.max.first == 12
        puts "Pair of Queens"
      elsif repeat_values.max.first == 11
        puts "Pair of Jacks"
      elsif repeat_values.max.first <= 10
        puts "Pair of #{repeat_values.key(2)}'s"
      end
    elsif repeat_values.values.include?(2) 
      false
    end
  end

  def self.high_card(number_values)
    if number_values.max == 14
      puts "High Card Ace"
    elsif number_values.max == 13
      puts "High Card King"
    elsif number_values.max == 12
      puts "High Card Queen"
    elsif number_values.max == 11
      puts "High Card Jack"
    elsif number_values.max <= 10
      puts "High Card of #{number_values.max}"
    end
  end

  def self.straight_values_from(first_value)
    (first_value...first_value + 5).to_a
  end

  def self.map_royals(array)
    array.map do |item|
      if item == 'J'
        item = 11
      elsif item == 'Q'
        item = 12
      elsif item == 'K'
        item = 13
      elsif item == 'A'
        item = 14
      else
        item 
      end
    end
  end

end

