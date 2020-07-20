1000.times do |registration_year|
    RegistrationYear.create!(name: "#{2000 + registration_year}" )
end

puts "Registration Year created"

Role.create(roles:"ADMIN")
Role.create(roles:"BUYER")
Role.create(roles:"SELLER")

puts "role created"

City.create!(name: "kolkata")
City.create!(name: "delhi")
City.create!(name: "mumbai")
City.create!(name: "bihar")
City.create!(name: "rajasthan")

puts "City Created"


    Brand.create!(name: "tata")
    Brand.create!(name: "maruti")
    Brand.create!(name: "honda")
    Brand.create!(name: "toyota")
    Brand.create!(name: "hyundai")
    Brand.create!(name: "audi")

puts "Brand created"

    Brand.find(1).models.create!(name: "sumo")
    Brand.find(2).models.create!(name: "dzire")
    Brand.find(3).models.create!(name: "civic")
    Brand.find(4).models.create!(name: "santro")
    Brand.find(5).models.create!(name: "a10")

puts "Model created"

    Variant.create!(name: "diesel")
    Variant.create!(name: "petrol")
    Variant.create!(name: "cng")

puts "Variant created"

    RegistrationState.create!(name: "west bengal")
    RegistrationState.create!(name: "maharashtra")
    RegistrationState.create!(name: "kerela")
    RegistrationState.create!(name: "kanpur")
    RegistrationState.create!(name: "jammu")

puts "Registration State created"

    KilometerDriven.create!(name: "0-10000")
    KilometerDriven.create!(name: "10000-20000")
    KilometerDriven.create!(name: "20000-30000")
    KilometerDriven.create!(name: "40000-60000")
    KilometerDriven.create!(name: "above 60000")

puts "Kilometer Driven created"

    CarCost.create!(condition: "fair", price: "5000")
    CarCost.create!(condition: "good", price: "10000")
    CarCost.create!(condition: "very good", price: "15000")
    CarCost.create!(condition: "excellent", price: "20000")
    CarCost.create!(condition: "-", price: "-")

puts "car cost created"

Role.first.users.create!(email:"admin@admin.com", password: "111111",email_confirm: true )
Role.last.users.create!(email:"seller@seller.com", password: "111111",email_confirm: true )
Role.find(2).users.create!(email:"buyer@buyer.com", password: "111111",email_confirm: true )

puts "SELLER BUYER & ADMIN Users  created"