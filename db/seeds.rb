# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Sample.destroy_all
UserSample.destroy_all

u1= User.create(username:"al", password: "1234")
u2= User.create(username:"bell", password: "1234")

s1= Sample.create(name: "sample1", image_file: "img1", audio_file: "audio1", genre:"808" , collection: true, creator: u1)
s2= Sample.create(name: "sample2" , image_file:"img2" , audio_file:"audio2" , genre:"909" , collection: false, creator: u2)

us = UserSample.create(user_id:  u1.id, sample_id: s1.id)

co1 = Comment.create(text:"comment 1", user_id: u1, sample_id: s1)
co2 = Comment.create(text:"comment 2", user_id: u2, sample_id: s2)
