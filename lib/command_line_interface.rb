def welcome
  # puts out a welcome message here!
  puts "Welcome to the Star Wars Universe!"
end

def main_menu
  puts "Enter CHARACTER to learn more about the characters in Star Wars.\n
  Enter PLANETS to learn more about the locales in the galaxy.\n
  Enter MOVIES to learn more about the Star Wars films.\n
  Please enter a command:"
  user_input = gets.chomp.downcase
  if user_input == "character"
    get_character_from_user
  elsif user_input == "movies"
    get_movie_from_user
  elsif user_input == "planets"
    get_planet_from_user
  else
    puts "I'm sorry, that is not a valid command."
    main_menu
  end
end

def get_character_from_user
  puts "Please enter a character"
  gets.chomp.downcase
end

def get_planet_from_user
  puts "Please enter the name of a planet in the Star Wars Universe \n
  (e.g. 'Tatooine', 'Dagobah', 'Hoth')"
  gets.chomp.downcase
end

def get_movie_from_user
  puts "Please enter the name of a movie in the Star Wars franchise.\n
  Keywords (e.g 'empire', 'clones', 'sith') are accepted."
  gets.chomp.downcase
end