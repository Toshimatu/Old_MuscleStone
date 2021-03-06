User.create!(name:  "Example User",email: "example@aaa.com", password: "foobar12", password_confirmation: "foobar12")

99.times do |n| #99人ユーザーを作成する
  name  = Faker::Name.name
  email = "example#{n+1}@aaa.com"
  password = "password12"
  User.create!(name: name, email: email, password: password, password_confirmation: password)
end

#投稿
users = User.order(:created_at).take(6)
50.times do 
  description = Faker::Lorem.sentence(5)
  users.each { |user| user.workouts.create!(description: description) }
end

#リレーションシップ
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
