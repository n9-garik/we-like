namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_wishes
    make_relationships
  end
end


def make_users
  User.create!(username: "Example User",
                  email: "example@test.ru",
                  password: "12345678",
                  password_confirmation: "12345678")
    99.times do |n|
      name = Faker::Name.name
      email = "example-#{n+1}@test.ru"
      password = "12345678"
      User.create!(username: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
                 end
end

def make_wishes                
  users = User.all(limit: 6)
  50.times do
    content = Faker::Lorem.sentence(5)
    users.each { |user| user.wishes.create!(content: content)}
  end
end

def make_relationships
  users = User.all
  user = users.first
  followed_users = users[2..50]
  followers = users[3..40]
  followed_users.each { |followed| user.follow!(followed) }
  followers.each      { |follower| follower.follow!(user) } 
end