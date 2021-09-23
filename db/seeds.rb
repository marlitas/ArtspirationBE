# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'factory_bot_rails'
require 'faker'

RatedArt.destroy_all
User.destroy_all
Art.destroy_all

# create users
10.times do
  FactoryBot.create :user
end

# create art
# 10.times do
GetArtFacade.show_me_art(50, 'large')
#   sleep(2.seconds)
# end

# create rated art
user1 = User.first
RatedArt.create!(user_id: user1.id, art_id: Art.first.id, liked: true)
RatedArt.create!(user_id: user1.id, art_id: Art.all[1].id, liked: true)
RatedArt.create!(user_id: user1.id, art_id: Art.all[2].id, liked: true)
RatedArt.create!(user_id: user1.id, art_id: Art.all[3].id, liked: true)
RatedArt.create!(user_id: user1.id, art_id: Art.all[4].id, liked: true)
RatedArt.create!(user_id: user1.id, art_id: Art.all[5].id, liked: false)
RatedArt.create!(user_id: user1.id, art_id: Art.all[6].id, liked: false)
RatedArt.create!(user_id: user1.id, art_id: Art.all[7].id, liked: false)

user2 = User.all[1]
RatedArt.create!(user_id: user2.id, art_id: Art.first.id, liked: true)
RatedArt.create!(user_id: user2.id, art_id: Art.all[1].id, liked: true)
RatedArt.create!(user_id: user2.id, art_id: Art.all[2].id, liked: true)
RatedArt.create!(user_id: user2.id, art_id: Art.all[3].id, liked: true)
RatedArt.create!(user_id: user2.id, art_id: Art.all[4].id, liked: true)
RatedArt.create!(user_id: user2.id, art_id: Art.all[5].id, liked: true)
RatedArt.create!(user_id: user2.id, art_id: Art.all[6].id, liked: true)
RatedArt.create!(user_id: user2.id, art_id: Art.all[7].id, liked: false)

user3 = User.all[2]
RatedArt.create!(user_id: user3.id, art_id: Art.first.id, liked: false)
RatedArt.create!(user_id: user3.id, art_id: Art.all[1].id, liked: true)
RatedArt.create!(user_id: user3.id, art_id: Art.all[2].id, liked: false)
RatedArt.create!(user_id: user3.id, art_id: Art.all[3].id, liked: true)
RatedArt.create!(user_id: user3.id, art_id: Art.all[4].id, liked: false)
RatedArt.create!(user_id: user3.id, art_id: Art.all[5].id, liked: true)
RatedArt.create!(user_id: user3.id, art_id: Art.all[6].id, liked: true)
RatedArt.create!(user_id: user3.id, art_id: Art.all[7].id, liked: false)
