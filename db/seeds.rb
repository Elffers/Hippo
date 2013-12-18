# User
# create_table "User", force: true do |t|
#     t.string   "name"
#     t.string   "email"
#     t.datetime "created_at"
#     t.datetime "updated_at"
#     t.text     "address"
#     t.string   "password_digest"
#   end
User.create(name:"Hs", email:"hs@hs.com", address:"123 4th St", password:"123", password_confirmation:"123")
User.create(name:"Blake", email:"blake@blake.com", address:"123 4th St", password:"123", password_confirmation:"123")
User.create(name:"Anne", email:"anne@anne.com", address:"123 4th St", password:"123", password_confirmation:"123")
User.create(name:"Whitney", email:"whitney@whitney.com", address:"123 4th St", password:"123", password_confirmation:"123")
User.create(name:"Test", email:"test@test.com", address:"123 4th St", password:"123", password_confirmation:"123")
# Product
# create_table "Product", force: true do |t|
#     t.integer  "user_id"
#     t.string   "name"
#     t.float    "price"
#     t.datetime "created_at"
#     t.datetime "updated_at"
#     t.text     "description"
#     t.boolean  "retired",     default: false
#     t.integer  "inventory"
  # end
Product.create(user_id:1, name:"blue shirt", price: 19.99, description:"Pretty and blue", retired: false, inventory: 12)
Product.create(user_id:1, name:"green shirt", price: 19.99, description:"Pretty and green", retired: false, inventory: 12)
Product.create(user_id:3, name:"red shirt", price: 19.99, description:"Pretty and red", retired: false, inventory: 12)
Product.create(user_id:5, name:"purple shirt", price: 19.99, description:"Pretty and purple", retired: false, inventory: 12)
Product.create(user_id:4, name:"rainbow shirt", price: 19.99, description:"Pretty and rainbow", retired: false, inventory: 12)
Product.create(user_id:2, name:"blue pants", price: 19.99, description:"Pretty and blue", retired: false, inventory: 12)
Product.create(user_id:4, name:"black pants", price: 19.99, description:"Pretty and pants", retired: false, inventory: 12)
Product.create(user_id:1, name:"blue dress", price: 19.99, description:"Pretty and blue", retired: false, inventory: 12)
Product.create(user_id:2, name:"pink dress", price: 19.99, description:"Pretty and pink", retired: false, inventory: 12)
Product.create(user_id:3, name:"black dress", price: 19.99, description:"Pretty and black", retired: false, inventory: 12)
Product.create(user_id:4, name:"red dress", price: 19.99, description:"Pretty and red", retired: false, inventory: 12)
Product.create(user_id:5, name:"red apple", price: 0.99, description:"yummy and red", retired: false, inventory: 12)
Product.create(user_id:2, name:"green apple", price: 0.99, description:"yummy and green", retired: false, inventory: 12)
Product.create(user_id:4, name:"green banana", price: 0.99, description:"fresh and green", retired: false, inventory: 12)
Product.create(user_id:2, name:"yellow banana", price: 0.99, description:"yummy and yellow", retired: false, inventory: 12)
Product.create(user_id:3, name:"french bread", price: 0.99, description:"yummy and warm", retired: false, inventory: 12)
Product.create(user_id:1, name:"chocolate bar", price: 0.99, description:"yummy and brown", retired: false, inventory: 12)
Product.create(user_id:5, name:"whiteboard", price: 190.99, description:"new and big", retired: false, inventory: 12)
Product.create(user_id:4, name:"desk", price: 100.99, description:"spacious and good for writing", retired: false, inventory: 12)
Product.create(user_id:3, name:"chair", price: 50.99, description:"Comfy", retired: false, inventory: 12)
Product.create(user_id:1, name:"podium", price: 70.99, description:"good for speeches", retired: false, inventory: 12)
Product.create(user_id:1, name:"computer", price: 1000.99, description:"techy and fast", retired: false, inventory: 12)
Product.create(user_id:4, name:"blue pen", price: 1.99, description:"good at writing in blue", retired: false, inventory: 12)
Product.create(user_id:4, name:"green pen", price: 1.99, description:"good at writing in green", retired: false, inventory: 12)
Product.create(user_id:4, name:"black pen", price: 1.99, description:"good at writing in black", retired: false, inventory: 12)
Product.create(user_id:2, name:"red pen", price: 1.99, description:"good at writing in red", retired: false, inventory: 12)
Product.create(user_id:5, name:"purple pen", price: 1.99, description:"good at writing in purple", retired: false, inventory: 12)
Product.create(user_id:2, name:"whiteout pen", price: 1.99, description:"good at fixing writing in blue", retired: false, inventory: 12)
Product.create(user_id:4, name:"notebook", price: 2.99, description:"yummy and green", retired: false, inventory: 12)
Product.create(user_id:5, name:"dictionary", price: 12.99, description:"yummy and green", retired: false, inventory: 12)
# Category
# create_table "Category", force: true do |t|
#     t.text     "name"
#     t.datetime "created_at"
#     t.datetime "updated_at"
#   end
Category.create(name:"food")
Category.create(name:"fruit")
Category.create(name:"furniture")
Category.create(name:"clothing")
Category.create(name:"women's clothing")
Category.create(name:"shirts")
Category.create(name:"dresses")
Category.create(name:"pens")
Category.create(name:"office supplies")

# CategoryProduct
# create_table "category_products", force: true do |t|
#     t.integer  "category_id"
#     t.integer  "product_id"
#     t.datetime "created_at"
#     t.datetime "updated_at"
#   end
CategoryProduct.create(category_id:1,product_id:12)
CategoryProduct.create(category_id:1,product_id:13)
CategoryProduct.create(category_id:1,product_id:14)
CategoryProduct.create(category_id:1,product_id:15)
CategoryProduct.create(category_id:1,product_id:16)
CategoryProduct.create(category_id:1,product_id:17)
CategoryProduct.create(category_id:2,product_id:12)
CategoryProduct.create(category_id:2,product_id:13)
CategoryProduct.create(category_id:2,product_id:14)
CategoryProduct.create(category_id:2,product_id:15)
CategoryProduct.create(category_id:3,product_id:19)
CategoryProduct.create(category_id:3,product_id:20)
CategoryProduct.create(category_id:3,product_id:21)
CategoryProduct.create(category_id:4,product_id:1)
CategoryProduct.create(category_id:4,product_id:2)
CategoryProduct.create(category_id:4,product_id:3)
CategoryProduct.create(category_id:4,product_id:4)
CategoryProduct.create(category_id:4,product_id:5)
CategoryProduct.create(category_id:4,product_id:6)
CategoryProduct.create(category_id:4,product_id:7)
CategoryProduct.create(category_id:4,product_id:8)
CategoryProduct.create(category_id:4,product_id:9)
CategoryProduct.create(category_id:4,product_id:10)
CategoryProduct.create(category_id:4,product_id:11)
CategoryProduct.create(category_id:5,product_id:1)
CategoryProduct.create(category_id:5,product_id:8)
CategoryProduct.create(category_id:5,product_id:9)
CategoryProduct.create(category_id:5,product_id:10)
CategoryProduct.create(category_id:5,product_id:11)
CategoryProduct.create(category_id:6,product_id:1)
CategoryProduct.create(category_id:6,product_id:2)
CategoryProduct.create(category_id:6,product_id:3)
CategoryProduct.create(category_id:6,product_id:4)
CategoryProduct.create(category_id:6,product_id:5)
CategoryProduct.create(category_id:7,product_id:8)
CategoryProduct.create(category_id:7,product_id:9)
CategoryProduct.create(category_id:7,product_id:10)
CategoryProduct.create(category_id:7,product_id:11)
CategoryProduct.create(category_id:8,product_id:23)
CategoryProduct.create(category_id:8,product_id:24)
CategoryProduct.create(category_id:8,product_id:25)
CategoryProduct.create(category_id:8,product_id:26)
CategoryProduct.create(category_id:8,product_id:27)
CategoryProduct.create(category_id:8,product_id:28)
CategoryProduct.create(category_id:9,product_id:18)
CategoryProduct.create(category_id:9,product_id:19)
CategoryProduct.create(category_id:9,product_id:20)
CategoryProduct.create(category_id:9,product_id:21)
CategoryProduct.create(category_id:9,product_id:22)
CategoryProduct.create(category_id:9,product_id:23)
CategoryProduct.create(category_id:9,product_id:24)
CategoryProduct.create(category_id:9,product_id:25)
CategoryProduct.create(category_id:9,product_id:26)
CategoryProduct.create(category_id:9,product_id:27)
CategoryProduct.create(category_id:9,product_id:28)
CategoryProduct.create(category_id:9,product_id:29)
CategoryProduct.create(category_id:9,product_id:30)
# Reviews
# create_table "reviews", force: true do |t|
#     t.integer  "rating"
#     t.integer  "product_id"
#     t.text     "description"
#     t.datetime "created_at"
#     t.datetime "updated_at"
#   end

