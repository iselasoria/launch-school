module Orchestratable
  protected

  def joinor(arr, delimiter=", ", word="or")
    case arr.size
    when 0 then ''
    when 1 then arr.first.to_s
    when 2 then arr.join(" #{word} ")
    else
      arr[-1] = "#{word} #{arr.last}"
      arr.join(delimiter)
    end

  end

  def display_welcome_message
    MESSAGES["greetings"]["welcome"]
  end

  def display_goodbye_message
    MESSAGES["greetings"]["goodbye"]
  end

  def reveal_oponent
    robot = ["Chappie","Mr.Roboto","Rosie Jetson"].sample
    puts MESSAGES["game"]["opponent"] + robot
  end

  def formalities
    display_welcome_message
    meet_player
    reveal_oponent
  end

  def draw_pretty
    puts ""
    board.draw
    puts ""
  end
  def display_board
    puts "You're a #{human.marker}."
    puts "Computer is a #{computer.marker}."
    draw_pretty
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def reset
    board.reset
    @current_marker = TTTGame::FIRST_TO_MOVE
    clear
  end

  def display_result
    # display_board
    clear_screen_and_display_board

    case board.winning_marker
    when human.marker
      puts MESSAGES["results"]["human_winner"]
    when computer.marker
      puts MESSAGES["results"]["comp_winner"]
    else
      puts MESSAGES["results"]["tie"]
    end
  end

  def display_play_again_message
    puts MESSAGES["play"]["again"]
    puts "\n"
  end

  def main_game
    formalities
    loop do
      display_board
      player_move
      display_result
      break unless play_again?
      reset
      display_play_again_message
    end
  end
end
# when you enter a taken square, it doesnt throw error