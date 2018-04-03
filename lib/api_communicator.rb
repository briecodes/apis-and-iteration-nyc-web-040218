require 'rest-client'
require 'json'
require 'pry'

def get_character_info_from_api(character)
  #make the web request
  all_characters = RestClient.get('http://www.swapi.co/api/people/')
  character_hash = JSON.parse(all_characters)


  # Using Each
  # movie_arr = []
  #
  # character_hash["results"].each do | char |
  #   if char["name"].downcase.include?(character.downcase)
  #     movie_arr = char["films"]
  #   end
  # end
  # return get_movie_info(movie_arr)

  # Using FIND
  # movie_hash = character_hash["results"].find do | char |
  #   char["name"].downcase.include?(character.downcase)
  # end
  # return get_movie_info(movie_hash["films"])

  # Using SELECT
  # movie_hash = character_hash["results"].select do |char|
  #   char["name"].downcase.include?(character.downcase) char["films"]
  # end
  # binding.pry
  # return get_movie_info(movie_hash[0]["films"])

  # Using MAP
  movie_hash = character_hash["results"].map { |char|
    if char["name"].downcase.include?(character.downcase)
      char["films"]
    end
  }.compact.flatten
  return get_movie_info(movie_hash)
end

def get_char_info(char)
  get_character_info_from_api.each do |char_hash|
    if p_hash[“name”].downcase.include?(planet.downcase)
      puts "#{char_hash["name"} is a #{get_char_species(char_hash["species"])} #{char_hash["gender"]} with #{char_hash["hair_color"]} hair, #{char_hash["eye_color"]} eyes, and #{char_hash["skin_color"]} skin who is #{char_hash["height"]}cm tall and weighs #{char_hash["mass"]}kg.

      They appear in the following films:
      #{get_char_movies(char_hash["films"]).join("\n")}"
    end
  end
end

def get_char_species(species_array)
  species_hash = species_array.map do |url|
    species = RestClient.get(url)
    species_parsed = JSON.parse(species)
  end
end


def get_char_movies(url_array)
  movie_info = url_array.each do |urls|
    fetch_films = RestClient.get(urls)
    films_parsed = JSON.parse(fetch_films)
  end
  movie_info.map do |hash|
    hash["title"]
  end
end

binding.pry

=begin def parse_character_movies(films_hash)
  # some iteration magic and puts out the movies in a nice list
  if films_hash.any?
    unsorted = []
    films_hash.each do |info|
      unsorted << info["title"]
    end
    puts unsorted.sort.join("\n")
  else
    puts "Sorry, that character doesn’t exist in the Star Wars Universe."
  end
end =end

def show_character_info(character)
  films_hash = get_character_movies_from_api(character)
  parse_character_movies(films_hash)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
