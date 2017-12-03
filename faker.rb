100.times do
  article = Article.new
  article.title = Faker::Lorem.sentence
  article.body = Faker::Lorem.paragraphs
  article.category_id = Category.all.sample.id
  article.publish_date = Faker::Date.between(Date.today - 1.year, Date.today)
  article.save
end
