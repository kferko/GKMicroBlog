# add four users
User.create(username: "greg", password: "pw", motto: "I love food!")
User.create(username: "kevin", password: "pwk", motto: "I'm hungry. Let's eat!")
User.create(username: "pickyeater", password: "pwp", motto: "I love writing mean reviews. This site sucks, btw.")
User.create(username: "jules", password: "julespw", motto: "Noshing day and night!")

# add first owner, menu, and two dishes
Owner.create(username: "han", password: "hnasty")
Menu.create(name: "Han Dynasty", address: "3711 Market Street, Philadelphia, PA", phone: "215-222-3711", description: "Authentic Szechuan Cuisine", owner_id: 1)
Dish.create(name: "Dan Dan Noodles", description: "Spicy, nutty beggar's noodles topped with minced pork", price: 7.95, menu_id: 1)
Dish.create(name: "Double Cooked Chicken", description: "Tender chicken tossed with leeks, hot peppers, black beans, and chili oil", price: 12.95, menu_id: 1)

# add second owner, menu, and two dishes
Owner.create(username: "pat", password: "king")
Menu.create(name: "Pat's King of Steaks", address: "1301 East Passyunk Avenue, Philadelphia, PA, 19147", phone: "215-468-1546", description: "The original home of the Philly Cheesesteak", owner_id: 2)
Dish.create(name: "Cheesesteak", description: "The best cheesesteak ever. Comes with choice of American, Provolone, or Whiz. With or without onions. Hurry up!", price: 10.00, menu_id: 2)
Dish.create(name: "Chicken Cheesesteak", description: "The chicken version of the best cheesesteak ever. Comes with choice of American, Provolone, or Whiz. With or without onions.", price: 9.50, menu_id: 2)

# add several reviews
Review.create(user_id: 1, dish_id: 1, description: "Seriously one of my favorite things to eat in the city. Caution: can be surprisingly spicy!", rating: 5)
Review.create(user_id: 2, dish_id: 1, description: "Very good usually, but it can be inconsistent in spicyness. A solid choice at Han Dynasty.", rating: 4)
Review.create(user_id: 3, dish_id: 1, description: "Tastes like mushy peanut butter. Gross. Next please!", rating: 1)
Review.create(user_id: 4, dish_id: 1, description: "Omg - looooove the dan dan!", rating: 5)
Review.create(user_id: 1, dish_id: 2, description: "Probably my favorite entree on the menu. Spicy, light, fresh, and accessible to Szechuan newbies.", rating: 5)
Review.create(user_id: 3, dish_id: 2, description: "Acceptable until I ate a pepper and nearly choked. Should come with a warning label.", rating: 2)
Review.create(user_id: 1, dish_id: 3, description: "I seriously don't understand the hype about this cheesesteak. It's OK. Not worth waiting in line for, though.", rating: 3)
Review.create(user_id: 3, dish_id: 3, description: "Wouldn't feed this to my worst enemy. Hot garbage.", rating: 1)
Review.create(user_id: 4, dish_id: 3, description: "Not bad, but there are better cheesesteaks in the city.", rating: 3)
Review.create(user_id: 1, dish_id: 4, description: "This was actually a really tasty sandwich, probably better than the famous original cheesesteak.", rating: 3)
Review.create(user_id: 2, dish_id: 4, description: "Pretty good stuff, but I'd strongly recommend getting provolone. Stay away from the whiz on this one!", rating: 3)

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

