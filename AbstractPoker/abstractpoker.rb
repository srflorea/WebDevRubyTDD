def classify_poker_hand(poker_hand)
  if test_ruby_array(poker_hand)
    return :not_a_ruby_array
  elsif test_number_of_cards_out_of_bounds(poker_hand)
    return :too_many_or_too_few_cards
  elsif test_is_not_integer(poker_hand)
    return :at_least_one_card_is_not_an_integer
  end
  poker_hand.sort!
  if test_out_of_bounds(poker_hand)
    :at_least_one_card_is_out_of_bounds
  elsif test_straight(poker_hand)
    :straight
  elsif res = test_of_a_kind(poker_hand)
    if res == :five_of_a_kind
      :impossible_hand
    elsif res == :four_of_a_kind
      :four_of_a_kind
    elsif test_full(poker_hand)
      :full_house
    else
      :three_of_a_kind
    end
  elsif test_two_pairs(poker_hand)
    :two_pairs
  elsif test_one_pair(poker_hand)
    :one_pair
  elsif test_high_card(poker_hand)
    :high_card
  else
    :valid_but_nothing_special
  end 
end

def test_high_card(poker_hand)
  no_in_row = 1
  max_in_row = 1
  last = -1
  poker_hand.each do |x|
    if x == last + 1
      no_in_row += 1
    else 
      no_in_row = 1
    end
    if no_in_row > max_in_row
        max_in_row = no_in_row
    end
    last = x
  end
  if max_in_row == 3 || max_in_row == 4
    return true
  else
    return false
  end
end

def test_one_pair(poker_hand)
  last = -1
  poker_hand.each do |x|
    if last == x
      return true
    end
  last = x
  end
  return false
end

def test_two_pairs(poker_hand)
  last = -1
  no_of_pairs = 0
  poker_hand.each do |x|
    if last == x
      no_of_pairs += 1
    end
    last = x
  end
  if no_of_pairs == 2
    return true
  end
  return false
end

def test_of_a_kind(poker_hand)
  last = -1
  no_of_a_kind = 1
  max_of_a_kind = 1
  poker_hand.each do |x|
    if last == x
      no_of_a_kind += 1
    else
      no_of_a_kind = 1
    end
    if no_of_a_kind > max_of_a_kind
      max_of_a_kind = no_of_a_kind
    end
  last = x
  end
  if max_of_a_kind == 3
    return :three_of_a_kind
  elsif max_of_a_kind == 4
    return :four_of_a_kind
  elsif max_of_a_kind == 5
    return :five_of_a_kind
  else
    false
  end
end

def test_straight(poker_hand)
  last = -1
  poker_hand.each do |x|
    if last != -1 && last + 1 != x
      return false
    end
  last = x
  end
  return true
end

def test_full(poker_hand)
  if poker_hand[0] == poker_hand[1]
    if poker_hand[1] == poker_hand[2]
      if poker_hand[3] == poker_hand[4]
        return true
      else
        return false
      end
    else
      return true
    end
  else
    return false
  end
end

def test_out_of_bounds(poker_hand)
  poker_hand.each do |x|
    if x < 1 || x > 1000
      return true
    end
  end
  return false
end

def test_is_not_integer(poker_hand)
  poker_hand.each do |x|
    unless x.is_a? Integer
      return true
    end
  end
  return false
end

def test_number_of_cards_out_of_bounds(poker_hand)
  length = poker_hand.count
  if length != 5
    return true
  else
    return false
  end
end

def test_ruby_array(poker_hand)
  unless poker_hand.kind_of?(Array)
    return true
  end
  return false
end