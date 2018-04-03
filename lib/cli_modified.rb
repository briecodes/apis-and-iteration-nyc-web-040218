def welcome
  # puts out a welcome message here!
  puts "Welcome to the Star Wars Universe!"
end

def main_menu_info
  puts "Enter CHARACTERS, PLANETS, or MOVIES to view a list, or enter a search keyword:"
end

def find_user_intention
  user_input = gets.chomp.downcase

  if user_input == "characters"
    list_chars
    main_menu
  elsif user_input == "movies"
    list_movies
    main_menu
  elsif user_input == "planets"
    list_planets
    main_menu
  elsif user_input == "help"
    main_menu
  elsif user_input == "exit"
    puts "Safe travels!"
    exit
  else
    user_input_search(user_input)
  end
end

def user_input_search(user_input)
  character = get_char_info(user_input)
  movie = display_movie_info(user_input)
  planet = display_planet_info(user_input)
  if character
    character
    main_menu
  elsif movie
    movie
    main_menu
  elsif planet
    planet
    main_menu
  else
    puts "Sorry, I couldn’t find anything on #{user_input}"
  end
end

def main_menu
  main_menu_info
  find_user_intention
end

# def main_menu
#   puts "Enter CHARACTER to learn more about the characters in Star Wars.\n
#   Enter PLANETS to learn more about the locales in the galaxy.\n
#   Enter MOVIES to learn more about the Star Wars films.\n
#   Please enter a command:"
#   user_input = gets.chomp.downcase
#   if user_input == "character"
#     get_character_from_user
#   elsif user_input == "movies"
#     get_movie_from_user
#   elsif user_input == "planets"
#     get_planet_from_user
#   else
#     puts "I'm sorry, that is not a valid command."
#     main_menu
#   end
# end

# def get_character_from_user
#   puts "Please enter a character"
#   gets.chomp.downcase
# end
#
# def get_planet_from_user
#   puts "Please enter the name of a planet in the Star Wars Universe \n
#   (e.g. 'Tatooine', 'Dagobah', 'Hoth')"
#   gets.chomp.downcase
# end
#
# def get_movie_from_user
#   puts "Please enter the name of a movie in the Star Wars franchise.\n
#   Keywords (e.g 'empire', 'clones', 'sith') are accepted."
#   gets.chomp.downcase
# end
