def classify_poker_hand(poker_hand)
  poker_hand.sort!
  if test_three_of_a_kind(poker_hand)
    :three_of_a_kind
  elsif test_two_pairs(poker_hand)
    :two_pairs
  elsif test_one_pair(poker_hand)
    :one_pair
  elsif test_high_card(poker_hand)
    :high_card
  else
    :unknown
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

def test_three_of_a_kind(poker_hand)
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
    return true
  else
    return false
  end
end
