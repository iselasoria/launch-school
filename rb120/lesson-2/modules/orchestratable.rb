module Orchestratable
  private

  def system_functionality
    sleep(1)
    system("clear")
  end

  def display_rules
    puts (MESSAGES["orchestration"]["rules"])
    puts "\n"
  end

  def display_oponent_secret
    case computer.name
    when 'Terminator' then slow_display(MESSAGES["opponents"]["intro"]["Terminator"])
    when 'Rusty' then slow_display(MESSAGES["opponents"]["intro"]["Rusty"])
    when 'Chappie' then slow_display(MESSAGES["opponents"]["intro"]["Chappie"])
    when 'Rosie Jetson' then slow_display(MESSAGES["opponents"]["intro"]["Rosie_Jetson"])
    when 'Andy Roid' then slow_display(MESSAGES["opponents"]["intro"]["Andy_Roid"])
    when 'Mr. Roboto' then slow_display(MESSAGES["opponents"]["intro"]["Mr.Roboto"])
    end
    puts "\n"
  end
  def display_oponent_face
    case computer.name
    when 'Terminator' then puts MESSAGES["opponents"]["ascii"]["Terminator"]
    when 'Rusty' then puts MESSAGES["opponents"]["ascii"]["Rusty"]
    when 'Chappie' then puts MESSAGES["opponents"]["ascii"]["Chappie"]
    when 'Rosie Jetson' then puts MESSAGES["opponents"]["ascii"]["Rosie_Jetson"]
    when 'Andy Roid' then puts MESSAGES["opponents"]["ascii"]["Andy_Roid"]
    when 'Mr. Roboto' then puts MESSAGES["opponents"]["ascii"]["Mr.Roboto"]
    end
  end

  def attack(human_turn) # samples mostly winning moves
    case human_turn
    when "rock" then [(0..25), (25..50), (0..0), (50..75), (75..100)]
    when "paper" then [(0..0), (0..0), (0..50), (50..100), (0..0)]
    when "scissors" then [(0..0), (0..0), (0..50), (0..0), (50..100)]
    when "lizard" then [(0..50), (0..0), (50..100), (0..0), (0..0)]
    when "spock" then [(0..0), (0..0), (0..33), (33..66), (66..100)]
    end
  end

  def probability_based_sample(tendencies) # randomized
    case rand(100)
    when tendencies[0] then 'rock'
    when tendencies[1] then 'paper'
    when tendencies[2] then 'scissors'
    when tendencies[3] then 'lizard'
    when tendencies[4] then 'spock'
    end
  end

  def assign_personality(human_turn) # personalities give randomized ranges
    case name
    when 'Terminator'
      then [(0..30), (60..75), (75..90), (90..100), (30..60)]
    when 'Rusty'
      then [(0..25), (25..50), (50..90), (0..0), (90..100)]
    when 'Chappie'
      then [(0..25), (25..50), (50..75), (0..0), (75..100)]
    when 'Rosie Jetson'
      then [(0..25), (25..75), (75..90), (90..100), (0..0)]
    when 'Andy Roid'
      then [(0..33), (33..66), (66..99), (0..0), (0..0)]
    when 'Mr. Roboto'
      then attack(human_turn) # [(0..20), (20..40), (40..60), (60..80), (80..100)]
    end
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
      flashing_display("#{human.name} is the ultimate winner!")
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
    display_winner
  end

  def end_of_round
    display_game_stats
    human.display_log
    display_goodbye_message
  end
end