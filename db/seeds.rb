Project.destroy_all

50.times do |index|
  Project.create!(name: Faker::Ancient.hero,
                  price: Faker::Number.between(3, 374),
                  origin: Faker::GameOfThrones.city)
end
