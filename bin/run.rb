#!/usr/bin/env ruby

require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"

welcome
main menu
character = get_character_from_user
planet = get_planet_from_user
movie = get_movie_from_user
show_character_info(character)
