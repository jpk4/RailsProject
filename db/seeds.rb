# frozen_string_literal: true

Seat.destroy_all
Alias.destroy_all
Book.destroy_all
# Title.destroy_all
House.destroy_all
Character.destroy_all

# frozen_string_literal: true

require 'open-uri'
require 'json'

def got_fetch(url)
  JSON.parse(open(url).read)
end

def house_url(id)
  "https://www.anapioficeandfire.com/api/houses/#{id}"
end

def book_url(id)
  "https://www.anapioficeandfire.com/api/books/#{id}"
end

def character_url(id)
  "https://www.anapioficeandfire.com/api/characters/#{id}"
end

def random_numbers(size, upper)
  Array.new(size) { rand upper }
end

def character_name_list(characters)
  character_list = characters.map { |c| c['name'] }
  character_list.join(', ')
end

# def seat_name_list(houses)
#   seat_list = houses.map { |h| h['name'] }
# end

book_ids = 1..10

book_ids.each do |book_id|
  book = got_fetch(book_url(book_id))
  name = book['name']
  released = book['released']
  number_of_pages = book['numberOfPages']

  books = Book.create(name: name, released: released, number_of_pages: number_of_pages)
end

character_ids = random_numbers(10, 2138)

character_ids.each do |character_id|
  character = got_fetch(character_url(character_id))
  name = character['name']
  born = character['born']
  died = character['died']
  culture = character['culture']
  character_quote = Faker::TvShows::GameOfThrones.unique.quote

  characters = Character.create(name: name, born: born, died: died, culture: culture, quote: character_quote)

  aliases = character['aliases']

  # puts "Character Name: #{name}"

  aliases.each do |aka|
    next if aka.empty?

    # puts "Alias: #{aka}"
    characters.aliases.create(name: aka)
  end
end

house_ids = random_numbers(10, 444)

house_ids.each do |house_id|
  house = got_fetch(house_url(house_id))
  name = house['name']
  region = house['region']
  coat_of_arms = house['coatOfArms']
  words = house['words']
  members = house['swornMembers'].map { |character_url| got_fetch(character_url) }

  houses = House.create(name: name, region: region, coat_of_arms: coat_of_arms, words: words)

  seats = house['seats']

  # puts "House Name: #{name}"

  seats.each do |seat|
    next if seat.empty?

    # puts "Seat: #{seat}"
    houses.seats.create(name: seat)
  end
end
puts "Created #{Book.count} Books."
puts "Created #{Character.count} Characters."
puts "Created #{House.count} Houses."
puts "Created #{Seat.count} Seats."
puts "Created #{Alias.count} Aliases."
