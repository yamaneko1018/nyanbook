# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
10.times do |n|
  email = Faker::Internet.email
  password = Faker::Internet.password
  name = Faker::Name.name
  uid = Faker::Internet.email

  User.create!(email: email,
               name: name,
               password: password,
               password_confirmation: password,
               uid: uid,
               id: n
               )
end
@user_ids = User.ids
@topic_ids = Topic.ids
10.times do
  content = "いいね！"
  topic_id = 163
  user_id = @user_ids.sample
  Comment.create!(content: content,
                 topic_id: topic_id,
                 user_id: user_id,
  )
end




 @user_ids = User.ids
 10.times do

   content = "あああああ"
   user_id = @user_ids.sample
   topic = Topic.create!(

                content: content,
                 user_id: user_id,

   )
   topic.remote_imageurl_url = "https://robohash.org/sintnobiset.png?size=300x300&set=set1"
 topic.save
 end
