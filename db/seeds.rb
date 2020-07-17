1000.times do |registration_year|
    RegistrationYear.create!(name: "#{2000 + registration_year}" )
end

Role.create(roles:"ADMIN")
Role.create(roles:"BUYER")
Role.create(roles:"SELLER")

puts "role created"


CarCost.create!(condition: "-", price: "-")

puts "car cost-created"


5.times do |demo|
    City.create!(name: "city-#{demo}")
    Brand.create!(name: "model-#{demo}")
    Brand.last.models.create!(name: "model-#{demo}")
    Variant.create!(name: "variant-#{demo}")
    RegistrationState.create!(name: "state- #{demo}")
    KilometerDriven.create!(name: "kilometer-#{demo}")
end

puts "car details created"
    CarCost.create!(condition: "fair", price: "5000")
    CarCost.create!(condition: "good", price: "10000")
    CarCost.create!(condition: "very good", price: "15000")
    CarCost.create!(condition: "excellent", price: "20000")
puts "car cost created"

Role.first.users.create!(email:"admin@admin.com", password: "111111",email_confirm: true )
Role.last.users.create!(email:"seller@seller.com", password: "111111",email_confirm: true )
Role.find(2).users.create!(email:"buyer@buyer.com", password: "111111",email_confirm: true )