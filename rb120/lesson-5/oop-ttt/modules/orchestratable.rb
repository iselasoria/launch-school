module Orchestratable
  def display_welcome_message
    # puts "Welcome to TTT!"
    MESSAGES["greetings"]["welcome"]
  end

  def display_goodbye_message
    # puts "Thanks for playing TTT, goodbye!"
    MESSAGES["greetings"]["goodbye"]
  end

  def draw_pretty
    puts ""
    board.draw
    puts ""
  end
end