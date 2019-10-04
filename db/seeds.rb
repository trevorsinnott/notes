5.times do
    Note.create({
        body: Faker::Lorem.paragraph
    })
end