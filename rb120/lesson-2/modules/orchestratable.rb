module Orchestratable
  private

  def system_functionality
    sleep(1)
    system("clear")
  end

  def display_rules
    # slow_display(MESSAGES["orchestration"]["rules"])
    puts (MESSAGES["orchestration"]["rules"])
    # puts "\n"
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

  def display_scoreboard # TODO Score class
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
      flashing_display("#{human.name} wins the game!")
    elsif computer.running_score == 5
      flashing_display("#{computer.name} is the ultimate winner!")
    end
    puts "\n"
  end

  def game_round
    human.choose
    computer.choose
    system_functionality
    display_move
    puts "\n"
    human.display_log
  end
end