# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

[
  { name: 'Мелодрама' },
  { name: 'Детектив' },
  { name: 'Драма' },
  { name: 'ІНШЕ' }
].each do |category|
  Category.find_or_create_by!(name: category[:name])
end

[
  {
    name: 'Аватар',
    year: 2012

  },
  {
    name: 'Аватар 2',
    year: 2020,
    desc: 'Продовження Аватара'
  },
  {
    name: 'Ганібал',
    year: 2014
  }
].each do |movie_params|
  movie = Movie.create(movie_params)
  next unless movie.save

  2.times do
    movie.categories << Category.find(rand(1...Category.count))
  end
  begin
    file = URI.parse('https://picsum.photos/900').open
    movie.image.attach(io: file, filename: movie.name.to_s, content_type: 'pictures.jpg')
  rescue OpenURI::HTTPError => e
    pp e
  end
end
