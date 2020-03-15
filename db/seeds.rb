# frozen_string_literal: true

require 'open-uri'
require 'json'
require 'csv'
require 'resolv-replace'

Seat.destroy_all
Alias.destroy_all
Book.destroy_all
Title.destroy_all
House.destroy_all
Character.destroy_all

csv_file = Rails.root + 'db/deaths.csv'
deaths = CSV.parse(File.read(csv_file), headers: true)

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
  array = (1..upper).to_a.sample(size)
end

def character_name_list(characters)
  character_list = characters.map { |c| c['name'] }
  character_list.join(', ')
end

book_ids = 1..12

book_ids.each do |book_id|
  book = got_fetch(book_url(book_id))
  url_id = book['url']
  name = book['name']
  released = book['released']
  number_of_pages = book['numberOfPages']

  books = Book.create(url_id: url_id, name: name, released: released, number_of_pages: number_of_pages)

  members = book['povCharacters'].map { |character_url| got_fetch(character_url) }

  members.each do |member|
    books.characters << Character.where(url_id: member['url']).first_or_create(name: member['name'], born: member['born'], died: member['died'], culture: member['culture'], quote: '', kill_count: 0)
  end
end

character_ids = random_numbers(100, 2138)
existing_character_urls = Character.pluck(:url_id)

character_ids.each do |character_id|
  character = got_fetch(character_url(character_id))
  unless Character.exists?(url_id: character['url'])
    existing_character_urls.push(character['url'])
  end
end

existing_character_urls.each do |character_url|
  character = got_fetch(character_url)
  url_id = character['url']
  name = character['name']
  born = character['born']
  died = character['died']
  culture = character['culture']
  character_quote = Faker::TvShows::GameOfThrones.quote
  kill_count = 0
  allegiances = character['allegiances'].map { |house_url| got_fetch(house_url) }

  deaths.each do |death|
    kill_count += 1 if death['killer'] == name
  end

  name = 'Unknown' if name.empty?

  if Character.exists?(url_id: url_id)
    characters = Character.find_by(url_id: url_id)
    characters.update(name: name, born: born, died: died, culture: culture, quote: character_quote, kill_count: kill_count)
  else
    characters = Character.where(url_id: url_id).first_or_create(name: name, born: born, died: died, culture: culture, quote: character_quote, kill_count: kill_count)
  end

  allegiances.each do |allegiance|
    characters.houses << House.where(url_id: allegiance['url']).first_or_create(name: allegiance['name'], region: allegiance['region'], coat_of_arms: allegiance['coatOfArms'], words: allegiance['words'])
  end

  aliases = character['aliases']

  aliases.each do |aka|
    next if aka.empty?

    characters.aliases.find_or_create_by(name: aka)
  end

  titles = character['titles']

  titles.each do |title|
    next if title.empty?

    characters.titles << Title.where(name: title).first_or_create
  end
end

house_ids = random_numbers(2, 444)
existing_house_urls = House.pluck(:url_id)

house_ids.each do |house_id|
  house = got_fetch(house_url(house_id))
  unless House.exists?(url_id: house['url'])
    existing_house_urls.push(house['url'])
  end
end

existing_house_urls.each do |house_url|
  house = got_fetch(house_url)
  url_id = house['url']
  name = house['name']
  region = house['region']
  coat_of_arms = house['coatOfArms']
  words = house['words']
  members = house['swornMembers'].map { |character_url| got_fetch(character_url) }

  if House.exists?(url_id: url_id)
    houses = House.find_by(url_id: url_id)
    houses.update(name: name, region: region, coat_of_arms: coat_of_arms, words: words)
  else
    houses = House.create(url_id: url_id, name: name, region: region, coat_of_arms: coat_of_arms, words: words)
  end

  seats = house['seats']

  seats.each do |seat|
    next if seat.empty?

    houses.seats.find_or_create_by(name: seat)
  end

  members.each do |member|
    next if Character.exists?(url_id: member['url'])
    member_name = member['name']
    if member_name.empty?
      member_name = 'Unknown'
    end
    houses.characters << Character.where(url_id: member['url']).first_or_create(name: member_name, born: member['born'], died: member['died'], culture: member['culture'], quote: '', kill_count: 0)
  end

  titles = house['titles']

  titles.each do |title|
    next if title.empty?

    unless Title.exists?(name: title)
      houses.titles << Title.where(name: title).first_or_create
    end
  end
end

puts "Created #{Book.count} Books."
puts "Created #{Character.count} Characters."
puts "Created #{House.count} Houses."
puts "Created #{Seat.count} Seats."
puts "Created #{Alias.count} Aliases."
puts "Created: #{Title.count} Titles"
puts "Death Count: #{deaths.count}"
