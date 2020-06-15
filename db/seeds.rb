# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

[
  {
    name: 'Аватар',
    year: 2012

  },
  {
    name: 'Аватар 2',
    year: 2020,
    desc: 'Продовження Аватара'
  }
].each do |movie_params|
  movie = Movie.create(movie_params)
  next unless movie.save

  begin
    file = URI.parse('https://picsum.photos/900').open
    movie.image.attach(io: file, filename: movie.name.to_s, content_type: 'pictures.jpg')
  rescue OpenURI::HTTPError => e
    pp e
  end
end
