# PHASE 2
def convert_to_int(str)
  begin
    Integer(str)
  rescue ArgumentError
    puts 'Cannot convert input to Integer'
  end
end

# PHASE 3
FRUITS = ["coffee"]

def reaction(maybe_fruit)
  begin
    raise StandardError unless FRUITS.include? maybe_fruit
    rescue StandardError
      puts "feed me coffee"
      maybe_fruit = gets.chomp
  retry
ensure
  puts "thank you"
  end
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"

  puts "Feed me a fruit! (Enter the name of a fruit:)"
  maybe_fruit = gets.chomp
  reaction(maybe_fruit)
end

# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    raise ArgumentError if yrs_known < 5 || name == "" || fav_pastime == ""

  rescue ArgumentError
    if yrs_known < 5
      puts "A friend of less than 5 years is no BEST friend"
      yrs_known = gets.chomp.to_i
      retry

    elsif name == ""
      puts "Your best friend needs a name."
      name = gets.chomp
      retry

    elsif fav_pastime == ""
      puts "Wait, you do what together?"
      fav_pastime = gets.chomp
      retry
    end

  ensure
    puts "Now THAT'S a bestie."
    @name = name
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me."
  end
end
