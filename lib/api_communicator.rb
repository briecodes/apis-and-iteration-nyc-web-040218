require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character)
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

  # iterate over the character hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `parse_character_movies`
  #  and that method will do some nice presentation stuff: puts out a list
  #  of movies by title. play around with puts out other info about a given film.
end

def get_movie_info(url_array)
  movie_info_arr = []
  url_array.each do |urls|
    fetch_films = RestClient.get(urls)
    movie_info_arr << JSON.parse(fetch_films)
  end
  return movie_info_arr
end

def parse_character_movies(films_hash)
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
end

def show_character_movies(character)
  films_hash = get_character_movies_from_api(character)
  parse_character_movies(films_hash)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
