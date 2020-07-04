# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do
  Category.find_or_create_by!(name: Faker::Book.genre)
end
5.times do
  Player.find_or_create_by!(name: Faker::Name.name)
end

20.times do
  movie = Movie.create(
    name: Faker::Movie.title,
    year: rand(1990...2020)
  )
  next unless movie.save

  movie.categories << Category.where(id: (0..3).map { Category.all.sample }.uniq)
  movie.players << Player.where(id: (0..2).map { Player.all.sample.id }.uniq)
  begin
    file = URI.parse('https://picsum.photos/900').open
    movie.image.attach(io: file, filename: movie.name.to_s, content_type: 'pictures.jpg')
  rescue OpenURI::HTTPError => e
    pp e
  end
end
if Rails.env.development?
  AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
end
