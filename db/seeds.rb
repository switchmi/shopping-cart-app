Category.create("name"=>"backpacks", "description"=>"Our stylish, innovative, and durable laptop backpacks and computer bags hold devices up to 17 inches and offer ergonomic fit for the urban commuter.")
Category.create("name"=>"messengers", "description"=>"Built by and for bike couriers and commuters, our durable messenger bags include cross-body straps and foldover flaps for comfort and convenience.")
Category.create("name"=>"travel-bags", "description"=>"Crafted with our trademark mix of durability and style, BroBagz travel bags and accessories are designed for globetrotters and day-trippers alike.")
Category.find(1).products.create("name"=>"The Division Backpack", "description"=>"A supremely organized monster of a work pack.", "feature"=>"If your work requires a lot of stuff and you like order but prefer not to look too stuffy, put the Authority on your back. It's a bring-the-office-with-you bag; pockets big and small makes sense of everything your day job and side gig require. And it feels good thanks to the backpack straps and a super cush grab handle. Pair that with a beautiful base fabric, tuck-away sternum straps, and an air mesh back panel that keeps your dress shirt dry, and you can dork out on the inside and be cool and collected on the outside.", "price"=>90, "stock"=>10)
Category.find(2).products.create("name"=>"Messenger Mike", "description"=>"A supremely organized monster of a work pack.", "feature"=>"If your work requires a lot of stuff and you like order but prefer not to look too stuffy, put the Authority on your back. It's a bring-the-office-with-you bag; pockets big and small makes sense of everything your day job and side gig require. And it feels good thanks to the backpack straps and a super cush grab handle. Pair that with a beautiful base fabric, tuck-away sternum straps, and an air mesh back panel that keeps your dress shirt dry, and you can dork out on the inside and be cool and collected on the outside.", "price"=>100, "stock"=>5)
Category.find(3).products.create("name"=>"Travel Bag Supreme", "description"=>"A supremely organized monster of a work pack.", "feature"=>"If your work requires a lot of stuff and you like order but prefer not to look too stuffy, put the Authority on your back. It's a bring-the-office-with-you bag; pockets big and small makes sense of everything your day job and side gig require. And it feels good thanks to the backpack straps and a super cush grab handle. Pair that with a beautiful base fabric, tuck-away sternum straps, and an air mesh back panel that keeps your dress shirt dry, and you can dork out on the inside and be cool and collected on the outside.", "price"=>150, "stock"=>3)
Admin.create("email"=>"admin@gmail.com", "password"=>"123456", "password_confirmation"=>"123456")
User.create("email"=>"user@gmail.com", "password"=>"123456", "password_confirmation"=>"123456")
Product.find(1).photos.create("url"=>"https://cdn.filestackcontent.com/HH4t8Hh8QNCDUANle3cV")
Product.find(1).photos.create("url"=>"https://cdn.filestackcontent.com/9ETWePXOS5mlcqOwqIr1")
Product.find(2).photos.create("url"=>"https://cdn.filestackcontent.com/GdmTS2TS0iq0uK6oqJot")
Product.find(2).photos.create("url"=>"https://cdn.filestackcontent.com/eSX3AnPrTo2XuUhMwvcm")
Product.find(3).photos.create("url"=>"https://cdn.filestackcontent.com/TYo9zNppQtqzoyl2pltq")
Product.find(3).photos.create("url"=>"https://cdn.filestackcontent.com/kcFQ816mSwWTxoFQj43w")
Category.find(1).products.create("name"=>"Carrier Wave", "description"=>"A supremely organized monster of a work pack.", "feature"=>"If your work requires a lot of stuff and you like order but prefer not to look too stuffy, put the Authority on your back. It's a bring-the-office-with-you bag; pockets big and small makes sense of everything your day job and side gig require. And it feels good thanks to the backpack straps and a super cush grab handle. Pair that with a beautiful base fabric, tuck-away sternum straps, and an air mesh back panel that keeps your dress shirt dry, and you can dork out on the inside and be cool and collected on the outside.", "price"=>90, "stock"=>10)
Category.find(2).products.create("name"=>"Funky Messenger", "description"=>"A supremely organized monster of a work pack.", "feature"=>"If your work requires a lot of stuff and you like order but prefer not to look too stuffy, put the Authority on your back. It's a bring-the-office-with-you bag; pockets big and small makes sense of everything your day job and side gig require. And it feels good thanks to the backpack straps and a super cush grab handle. Pair that with a beautiful base fabric, tuck-away sternum straps, and an air mesh back panel that keeps your dress shirt dry, and you can dork out on the inside and be cool and collected on the outside.", "price"=>100, "stock"=>5)
Category.find(3).products.create("name"=>"Cargo Cabin", "description"=>"A supremely organized monster of a work pack.", "feature"=>"If your work requires a lot of stuff and you like order but prefer not to look too stuffy, put the Authority on your back. It's a bring-the-office-with-you bag; pockets big and small makes sense of everything your day job and side gig require. And it feels good thanks to the backpack straps and a super cush grab handle. Pair that with a beautiful base fabric, tuck-away sternum straps, and an air mesh back panel that keeps your dress shirt dry, and you can dork out on the inside and be cool and collected on the outside.", "price"=>150, "stock"=>3)
Product.find(4).photos.create("url"=>"https://cdn.filestackcontent.com/wFOZIvtbRCqMaW1VEI6B")
Product.find(5).photos.create("url"=>"https://cdn.filestackcontent.com/vhKOru3SA2w1sFJ5N8Wh")
Product.find(6).photos.create("url"=>"https://cdn.filestackcontent.com/4t3Dp1jdRmepDN1blUn3")
