module Prettyfiable
  def slow_print(msg)
    msg.chars.each do |ch|
      putc ch
      sleep(0.05)
      $stdout.flush
    end
    puts "\n"
  end
end

