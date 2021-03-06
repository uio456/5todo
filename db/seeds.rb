# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Vendor.destroy_all

vendor_list = [
  {name: "Nike"},
  {name: "BoBoCar"},
  {name: "Shopee"},
  {name: "Eslite"}
]

vendor_list.each do |vendor|
  Vendor.create( name: vendor[:name])
  puts "#{vendor[:name]} has created!"
end

#Default admin
AdminStaff.create(email: "root@example.com", password: "12345678", role: "superman", name: "Duncan")
puts "Default admin create!"

Promotional.create(title: "折扣", discount_deadline: Time.now+1.years)

price = [100, 200, 300]
30.times do |i|
  p = Product.create(
    title: FFaker::Product.product_name,
    price: price.sample,
    vendor_id: Vendor.all.sample.id,
    state: "normal"
  )
  puts p.title
end
