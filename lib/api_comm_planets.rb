require 'rest-client'
require 'json'
require 'pry'

def get_planets_from_api
  all_planets = RestClient.get('https://swapi.co/api/planets/')
  planet_hash = JSON.parse(all_planets)
  planet_hash["results"].map do |hash|
    hash
  end
  # Returns Hash of Planets & Info.
end

def list_planets
  planet_array = get_planets_from_api.map {|hash| hash["name"] }
  puts planet_array.sort.join("\n")
  # Puts list of planets in a nice list.
end

def get_planet_residents(residents_array)
  residents_hash = residents_array.map do |url|
    residents = RestClient.get(url)
    residents_parsed = JSON.parse(residents)
  end

  residents_hash.map do |hash|
    hash["name"]
  end
end

def get_planet_films(films_array)
  films_hash = films_array.map do |url|
    films = RestClient.get(url)
    films_parsed = JSON.parse(films)
  end
  films_hash.map do |hash|
    hash["title"]
  end
end

def get_planet_info(planet)
  get_planets_from_api.map do |p_hash|
    if p_hash["name"].downcase.include?(planet.downcase)
      puts "Planet Name: #{p_hash["name"]}"
      puts "Rotation Period: #{p_hash["rotation_period"]}"
      puts "Climate: #{p_hash["climate"]}"
      puts "Population: #{p_hash["population"]}"
      puts "Residents: #{get_planet_residents(p_hash["residents"]).join(", ")}"
      puts "Films: #{get_planet_films(p_hash["films"]).join(", ")}"
    end
  end
  return "Hope that’s helpful!"
end

binding.pry
