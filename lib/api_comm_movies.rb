require 'rest-client'
require 'json'
require 'pry'

def get_movies_from_api
  all_planets = RestClient.get('https://swapi.co/api/films/')
  planet_hash = JSON.parse(all_planets)
  planet_hash["results"].map do |hash|
    hash
  end
  # Returns Hash of Movies & Info.
end

def list_movies
  movies_array = get_movies_from_api.map {|hash| hash["title"] }
  puts movies_array.join("\n")
  # Puts list of the movies in a nice list.
end

def display_movie_info(movie)
  get_movies_from_api.each do |p_hash|
    if p_hash["title"].downcase.include?(movie.downcase)
      puts "Film: Episode #{p_hash["episode_id"]}, #{p_hash["title"]}"
      puts "Director: #{p_hash["director"]}"
      puts "Release Date: #{p_hash["release_date"]}"
    end
  end
  # return "Hope that’s helpful!"
end

# binding.pry
