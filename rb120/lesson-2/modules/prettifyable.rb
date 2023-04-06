module Prettifyable
  attr_reader :msg

  def flashing_display(msg)
    5.times do
      print "\r#{msg}"
      sleep 0.5
      print "\r#{' ' * msg.size}"
      sleep 0.5
    end
  end

  def slow_display(msg)
    msg.each_char do |c|
      putc c
      sleep(0.05)
      $stdout.flush
    end
  end
end