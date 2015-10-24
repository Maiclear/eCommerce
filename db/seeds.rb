# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Product.destroy_all
Review.destroy_all
# Category.destroy_all



# (1..20).each do |n|
#   posts << Post.create(title: "Post nº #{n}", content: "COmentario del post numero #{n}")
# end


# (1..50).each do |n|
#   comments << Comment.create( content: " Comentario numero #{n}", post: posts[rand(1..(posts.length))])
# end

products = []

(1..50).each do |m|
  products << Product.create(
                        name: Faker::Commerce.product_name,
                        description: Faker::Lorem.sentence,
                        price: Faker::Commerce.price,
                        stock: rand(1..100)
                        )

end


reviews= []

(1..20).each do |r|
  reviews << Review.create(
                           content: Faker::Lorem.paragraph(3),
                           product: products[rand(products.length)]
                           )
end

# categories=[]

# (1..10).each do |r|
#   categories << Category.create(
#                                 name: Faker::Commerce.department
#                                 )
