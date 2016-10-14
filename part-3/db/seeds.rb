require 'faker'

10.times do |t|

  User.create(user_name: Faker::Name.name, password: "123")
end

10.times do |t|
  Item.create(name: Faker::Lorem.word, description: Faker::Lorem.sentence, bid_start: Faker::Date.forward(2), bid_end: Faker::Date.forward(3), user_id: rand(1..10))
end

10.times do |t|
  Bid.create(amount: Faker::Number.decimal(2), item_id: rand(1..10), user_id: rand(1..10))
end