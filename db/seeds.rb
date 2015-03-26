# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# User.create!(full_name:  "Duy Hoan",
#              email: "redriver91@gmail.com",
#              password:              "10071991",
#              password_confirmation: "10071991")

# 3.times do |n|
#   name  = Faker::Name.name
#   email = "email-#{n+1}@gmail.com"
#   password = "10071991"
#   User.create!(full_name:  name,
#                email: email,
#                password:              password,
#                password_confirmation: password)
# end
# Category.create!(name:  "Category 1")
# 5.times do |n|
#   Category.create! name: "Category #{n+1}"
# end
# categories = Category.take(5)
# 20.times do |n|
#   categories.each { |category|
#     category.words.create! content: "Word #{category.id}-#{n}"
#   }
# end
words = Word.all
4.times do |n|
  words.each { |word|
    if n == 1
      right = 1
    else 
      right = 0
    end
    word.answers.create!(
      content: "Answer #{word.id}-#{n+1}",
      is_right: right
    )
  }
end