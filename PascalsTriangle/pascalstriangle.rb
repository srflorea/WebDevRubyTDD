def compute_row(n)
	unless n.is_a? Integer
		return nil
	end
	n = n - 1
	line = [1]
	array = (0..n-1)
    array.each do |k|
    	new_el = line[k] * (n-k) / (k+1)
    	line << new_el
    	#puts k
    end
	return line
end

