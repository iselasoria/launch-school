module Orchestratable
  private

  def system_functionality(sec)
    sleep(sec)
    system("clear")
  end

  def display_rules(sec)
    puts (MESSAGES["orchestration"]["rules"])
    system_functionality(sec)
  end

  def display_move
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."
  end

  def display_winner
    if human.move.win?(computer.move)
      puts "#{human.name} gets 1 point!"
    elsif computer.move.win?(human.move)
      puts "#{computer.name} gets 1 point!"
    else
      puts MESSAGES["orchestration"]["tie"]
    end
  end

  def increment_score
    if human.move.win?(computer.move)
      human.running_score += 1
    elsif computer.move.win?(human.move)
      computer.running_score += 1
    end
  end

  def display_scoreboard
    human_padding = human.running_score.to_s.center(human.name.size)
    human_size = human.name.size
    comp_padding = computer.running_score.to_s.center(computer.name.size)
    comp_size = computer.name.size

    puts "+" + "-" * human_size + "+" + "-" * comp_size + "+"
    puts "|" + human.name + "|" + computer.name + "|"
    puts "+" + "-" * human_size + "+" + "-" * comp_size + "+"
    puts "|" + human_padding + "|" + comp_padding + "|"
    puts "+" + "-" * human_size + "+" + "-" * comp_size + "+"
  end

  def display_ultimate_winner
    if human.running_score == 5 # TODO
      flashing_display("#{human.name} is the ultimate winner!")
    elsif computer.running_score == 5
      flashing_display("#{computer.name} is the ultimate winner!")
    end
    puts "\n"
  end

  def wipe_scoreboard
    human.running_score = 0
    computer.running_score = 0
    puts "Clearning the score board, get ready for another round!"
  end

  def game_round
    human.choose
    computer.choose
    system_functionality(1)
    display_move
    puts "\n"
    display_winner
  end

  def end_of_round
    display_game_stats
    human.display_log
    display_goodbye_message
  end
end