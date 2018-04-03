require 'rest-client'
require 'json'
require 'pry'

def get_character_info_from_api(character)
  all_characters = RestClient.get('http://www.swapi.co/api/people/')
  char_hash = JSON.parse(all_characters)
  char_hash["results"].map do |hash|
    hash
end

def get_char_info(char)
  get_character_info_from_api.each do |char_hash|
    if char_hash["name"].downcase.include?(char.downcase)
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
  species_hash.map do |hash|
    hash["species"]
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

def list_chars
  chars_array = get_character_info_from_api.map {|hash| hash["name"]}
  puts chars_array.sort.join("\n")
end

binding.pry
