def classify_poker_hand(poker_hand)
  poker_hand.sort!
  no_in_row = 1
  max_in_row = 1
  last = -1
  poker_hand.each do |x|
  	if x == last + 1
  		no_in_row += 1
  	else 
  		if no_in_row > max_in_row
  			max_in_row = no_in_row
  		end
  		no_in_row = 1
  	end
  	last = x
  end
  puts max_in_row
  if max_in_row == 3 || max_in_row == 4
  	:high_card
  else
  	:unexpected_return_value
  end
end

