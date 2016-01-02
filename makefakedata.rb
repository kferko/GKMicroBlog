# add four users
User.create(username: "greg", password: "pw", motto: "I love food!")
User.create(username: "kevin", password: "pwk", motto: "I'm hungry. Let's eat!")
User.create(username: "foodsnob", password: "pwp", motto: "I love writing mean reviews. This site sucks, btw.")
User.create(username: "jules", password: "julespw", motto: "Noshing day and night!")

# add first owner, menu, and two dishes
Owner.create(username: "han", password: "hnasty")
Menu.create(name: "Han Dynasty", 
			description: "Authentic Szechuan Cuisine",
			cuisine: "Chinese",
			street: "3711 Market Street", 
			city: "Philadelphia",
			state: "PA",
			zip: "19104",
			phone: "215-222-3711",
			website: "http://www.handynasty.net",
			hours_1_sun: "12pm-8pm",
			hours_2_mon: "11am-9pm",
			hours_3_tue: "11am-9pm",
			hours_4_wed: "11am-9pm",
			hours_5_thu: "11am-9pm",
			hours_6_fri: "11am-9pm",
			hours_7_sat: "11am-9pm",
			alcohol: true,
			parking: false,
			price: 3,
			owner_id: 1)

Dish.create(name: "Dan Dan Noodles", description: "Spicy, nutty beggar's noodles topped with minced pork", price: 7.95, menu_id: 1)
Dish.create(name: "Double Cooked Chicken", description: "Tender chicken tossed with leeks, hot peppers, black beans, and chili oil", price: 12.95, menu_id: 1)

# add second owner, menu, and two dishes
Owner.create(username: "pat", password: "king")
Menu.create(name: "Pat's King of Steaks", 
			description: "The original home of the Philly Cheesesteak",
			cuisine: "American",
			street: "1301 East Passyunk Avenue", 
			city: "Philadelphia",
			state: "PA",
			zip: "19147",
			phone: "215-468-1546",
			website: "http://www.patskingofsteaks.com",
			hours_1_sun: "12pm-8pm",
			hours_2_mon: "11am-9pm",
			hours_3_tue: "11am-9pm",
			hours_4_wed: "11am-9pm",
			hours_5_thu: "11am-9pm",
			hours_6_fri: "11am-9pm",
			hours_7_sat: "11am-9pm",
			alcohol: false,
			parking: false,
			price: 1,
			owner_id: 2)

Dish.create(name: "Cheesesteak", description: "The best cheesesteak ever. Comes with choice of American, Provolone, or Whiz. With or without onions. Hurry up!", price: 10.00, menu_id: 2)
Dish.create(name: "Chicken Cheesesteak", description: "The chicken version of the best cheesesteak ever. Comes with choice of American, Provolone, or Whiz. With or without onions.", price: 9.50, menu_id: 2)

# add third owner, menu, and two dishes
Owner.create(username: "mark", password: "italian")
Menu.create(name: "Vetri", 
			description: "The finest Italian kitchen in Philadelphia",
			cuisine: "Italian",
			street: "1312 Spruce Street", 
			city: "Philadelphia",
			state: "PA",
			zip: "19107",
			phone: "215-732-3478",
			website: "http://www.vetriristorante.com",
			hours_1_sun: "12pm-8pm",
			hours_2_mon: "11am-9pm",
			hours_3_tue: "11am-9pm",
			hours_4_wed: "11am-9pm",
			hours_5_thu: "11am-9pm",
			hours_6_fri: "11am-9pm",
			hours_7_sat: "11am-9pm",
			alcohol: true,
			parking: false,
			price: 4,
			owner_id: 3)

Dish.create(name: "Spinach gnocchi with brown butter", description: "Soft dough dumplings in a rich brown butter sauce", price: 24.00, menu_id: 3)
Dish.create(name: "Almond tortellini with truffle sauce", description: "Handmade tortellini filled with almond paste and vegetables", price: 22.00, menu_id: 3)

# add fourth owner, menu, and two dishes
Owner.create(username: "rich", password: "veggie")
Menu.create(name: "Vedge", 
			description: "A vegetable restaurant",
			cuisine: "Vegetarian",
			street: "1221 Locust Street", 
			city: "Philadelphia",
			state: "PA",
			zip: "19107",
			phone: "215-320-7500",
			website: "http://www.vedgerestaurant.com",
			hours_1_sun: "12pm-8pm",
			hours_2_mon: "11am-9pm",
			hours_3_tue: "11am-9pm",
			hours_4_wed: "11am-9pm",
			hours_5_thu: "11am-9pm",
			hours_6_fri: "11am-9pm",
			hours_7_sat: "11am-9pm",
			alcohol: true,
			parking: false,
			price: 3,
			owner_id: 4)
Dish.create(name: "Grilled seitan", description: "Horseradish, pickled cherry, charred kohirabi slaw", price: 16.00, menu_id: 4)
Dish.create(name: "Wood roasted carrot", description: "kimchee reuben, pumpernickel, sauerkraut puree", price: 14.00, menu_id: 4)

# add several reviews
Review.create(user_id: 1, dish_id: 1, menu_id: 1, title: "The Szechuan king of Philly!", description: "Seriously one of my favorite things to eat in the city. Caution: can be surprisingly spicy!", rating: 5)
Review.create(user_id: 2, dish_id: 1, menu_id: 1, title: "Come prepared for spicyness", description: "Very good usually, but it can be inconsistent in spicyness. A solid choice at Han Dynasty.", rating: 4)
Review.create(user_id: 3, dish_id: 1, menu_id: 1, title: "Overrated Chinese food", description: "Tastes like mushy peanut butter. Gross. Next please!", rating: 1)
Review.create(user_id: 4, dish_id: 1, menu_id: 1, title: "The BEST noodle spot", description: "Omg - looooove the dan dan!", rating: 5)
Review.create(user_id: 1, dish_id: 2, menu_id: 1, title: "The Szechuan king of Philly!", description: "Probably my favorite entree on the menu. Spicy, light, fresh, and accessible to Szechuan newbies.", rating: 5)
Review.create(user_id: 3, dish_id: 2, menu_id: 1, title: "Overrated Chinese food", description: "Acceptable until I ate a pepper and nearly choked. Should come with a warning label.", rating: 2)
Review.create(user_id: 1, dish_id: 3, menu_id: 2, title: "Overhyped tourist trap", description: "I seriously don't understand the hype about this cheesesteak. It's OK. Not worth waiting in line for, though.", rating: 3)
Review.create(user_id: 3, dish_id: 3, menu_id: 2, title: "Stay away!", description: "Wouldn't feed this to my worst enemy. Hot garbage.", rating: 1)
Review.create(user_id: 4, dish_id: 3, menu_id: 2, title: "A Philadelphia institution. Not bad!", description: "Not bad, but there are better cheesesteaks in the city.", rating: 3)
Review.create(user_id: 1, dish_id: 4, menu_id: 2, title: "Overhyped tourist trap", description: "This was actually a really tasty sandwich, probably better than the famous original cheesesteak.", rating: 3)
Review.create(user_id: 2, dish_id: 4, menu_id: 2, title: "You gotta try Pat's at least once.", description: "Pretty good stuff, but I'd strongly recommend getting provolone. Stay away from the whiz on this one!", rating: 3)
Review.create(user_id: 1, dish_id: 5, menu_id: 3, title: "Perfect Valentine's Night", description: "I still dream about this dish. You will never think of gnocchi in the same way after experiencing it in the rich brown butter. Get a reservation right now!", rating: 4)
Review.create(user_id: 2, dish_id: 6, menu_id: 3, title: "Best italian in the city", description: "An outstanding dish. The almonds and truffle were perfectly balanced and just left me wanting more.", rating: 5)
Review.create(user_id: 3, dish_id: 7, menu_id: 4, title: "Vegetarian paradise", description: "This was easily the best seitan I've ever had. The texture was sublime. Who needs meat when you have Vedge?", rating: 5)
Review.create(user_id: 4, dish_id: 8, menu_id: 4, title: "Brilliant take on veggies", description: "You might think that ordering a carrot as an entree is bizarre (well, I did), but have no fear. This dish was so suprisingly satisfying that I can't wait to order it again! ", rating: 4)

# add user_friendships
UserFriendship.create(user_id: 1, user_friend_id: 2)
UserFriendship.create(user_id: 1, user_friend_id: 3)
UserFriendship.create(user_id: 1, user_friend_id: 4)
UserFriendship.create(user_id: 2, user_friend_id: 1)
UserFriendship.create(user_id: 2, user_friend_id: 3)
UserFriendship.create(user_id: 4, user_friend_id: 1)
UserFriendship.create(user_id: 4, user_friend_id: 2)
UserFriendship.create(user_id: 4, user_friend_id: 3)
UserFriendship.create(user_id: 3, user_friend_id: 2)
