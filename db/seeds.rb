Item.destroy_all
User.destroy_all

puts "Creating users"
counter = 0
2.times do
  counter += 1
  User.create!(
    first_name: ["Michel", "Robert"][counter - 1],
    last_name: ["Petit", "Geraud"][counter - 1],
    phone_number: ["06 89 54 28 57", "07 48 22 36 98"][counter - 1],
    civility: ["M.", "M."][counter - 1],
    address: ["23 av. des écoles", "45 rue dufour"][counter - 1],
    post_code: ["69008", "75015"][counter - 1],
    city: ["Lyon", "Paris"][counter - 1],
    country: ["France", "France"][counter - 1],
    status: ["Particulier", "Pro"][counter - 1],
    email: ["michelpetit@gmail.com", "robertgeraud@gmail.com"][counter - 1],
    password: "password"
    )
end

puts "Creating items"
item_category = ["Véhicule", "Jouet", "Multimédia", "Immobilier", "Décoration"]

100.times do
  Item.create!(
    price: Faker::Commerce.price,
    category: item_category.sample,
    item_name: Faker::Commerce.product_name,
    description: Faker::Lorem.paragraph(2),
    picture: Faker::LoremPixel.image,
    user_id: User.all.sample.id
    )
end
