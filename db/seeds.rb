# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
10.times do |n|
  email = Faker::Internet.email
  password = "password"
  name = Faker::Name.name
  uid = Faker::Omniauth.facebook
  provider = Faker::Omniauth.facebook
   User.create(
               email: email,
               name: name,
               password: password,
               provider: provider,
               uid: uid
               )
end

n = 1
while n <= 10
  Comment.create(content: "いいね！",
                 topic_id: n,
                 user_id: n
  )
n = n + 1
end

n = 1
while n <= 10
      Topic.create(content: "夏だね",
                    user_id: n
    )
  #  topic.remote_imageurl_url = "https://robohash.org/sintnobiset.png?size=300x300&set=set1"
 n = n + 1
 end
