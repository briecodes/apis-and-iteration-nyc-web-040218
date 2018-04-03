def get_character_info_from_api(character)
  #make the web request
  all_characters = RestClient.get('http://www.swapi.co/api/people/')
  character_hash = JSON.parse(all_characters)
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
