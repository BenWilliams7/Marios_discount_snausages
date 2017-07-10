Project.destroy_all
Review.destroy_all

50.times do |index|
  project = Project.create!(name: Faker::Ancient.hero,
                  price: Faker::Number.between(3, 374),
                  origin: Faker::GameOfThrones.city)
      5.times do |index|
        project.reviews.create(author: Faker::Name.name,
        content_body: Faker::Lorem.characters(100),
        rating: Faker::Number.between(1, 5),
        project_id: Faker::Number.between(1, 50))
      end
end
