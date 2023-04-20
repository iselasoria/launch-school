module Orchestratable
  def display_welcome_message
    MESSAGES["greetings"]["welcome"]
  end

  def display_goodbye_message
    MESSAGES["greetings"]["goodbye"]
  end

  def draw_pretty
    puts ""
    board.draw
    puts ""
  end
end