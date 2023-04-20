module Movable
  def human_moves
    puts "Choose a square (#{joinor(board.unmarked_keys,', ','or')}):"
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      MESSAGES["validation"]["invalid_square"]
    end

    # binding.pry
    # whose responsiblity is it, the player or board?
    board[square] = human.marker
  end

  def player_move
    loop do
      current_player_moves
      break if board.someone_won? || board.full?
      clear_screen_and_display_board if human_turn?
    end
  end

  def computer_moves
    board[board.unmarked_keys.sample] = computer.marker
  end

  def human_turn?
    @current_marker == TTTGame::HUMAN_MARKER
  end
end