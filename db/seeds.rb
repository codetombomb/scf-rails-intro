15.times do 
    Book.create(
        title: Faker::Book.title,
        author: Faker::Book.author,
        publication_year: rand(1775...2022),
        number_of_pages: rand(100...1500)
    )
end