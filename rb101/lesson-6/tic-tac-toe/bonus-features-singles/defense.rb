def find_at_risk_square(line, board) # line comes from an iteration above
  if board.values_at(*line).count('X') == 2 # splat operation passes one element at a time
    board.select{|k,v| line.include?(k) && v == ' '}.keys.first # this selects the first key at risk
  else
    nil
  end
end