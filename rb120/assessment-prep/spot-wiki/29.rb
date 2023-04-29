# https://launchschool.com/books/oo_ruby/read/inheritance


# When does accidental method overriding occur, and why? Give an example.

# Accidental method overriding occurs when the programmer is unfamiliar with methods form Object or BasicObject
# and accidentally gives a custom class methods by the same name. It can be avoided by familiarizing oneself with the
# instance methods of the superclasses and by giving unique method names specific to the usecase

class Ticket
  attr_reader :artist, :venue, :date

  def initialize(artist, venue, date)
    @artist = artist
    @venue = venue
    @date = date
  end

  def send
    puts "This is unexpected"
  end
end

concert = Ticket.new("Depeche Mode", "Hollywood Bowl", "12312023")

puts "What do you want to know about your upcomming event?"
inquiry = gets.chomp

if concert.respond_to?(inquiry)
  puts concert.__send__(inquiry)
else
  puts "Sorry, that information is not available"
end

