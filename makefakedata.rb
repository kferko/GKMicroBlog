# add four users
User.create(username: "greg", 
			password: "pw", 
			motto: "I love food!",
			firstname: "Greg",
			lastname: "Park",
			email: "greg@example.com",
			phone: "215-555-5555",
			street: "30 S. 17th Street",
			city: "Philadelphia",
			state: "PA",
			zip: "19107")

User.create(username: "kevin", 
			password: "pw", 
			motto: "I'm hungry. Let's eat!",
			firstname: "Kevin",
			lastname: "Jones",
			email: "kevin@example.com",
			phone: "215-555-5555",
			street: "30 S. 17th Street",
			city: "Philadelphia",
			state: "PA",
			zip: "19107")

User.create(username: "foodie",
			password: "pw",
			motto: "Food is my life.",
			firstname: "Debbie",
			lastname: "Downer",
			email: "debbie@example.com",
			phone: "215-555-5555",
			street: "30 S. 17th Street",
			city: "Philadelphia",
			state: "PA",
			zip: "19107")

User.create(username: "jules",
 			password: "pw",
 			motto: "Noshing day and night!",
 			firstname: "Jules",
			lastname: "Park",
			email: "jules@example.com",
			phone: "215-555-5555",
			street: "30 S. 17th Street",
			city: "Philadelphia",
			state: "PA",
			zip: "19107")

# add first owner, menu, and two dishes
Owner.create(username: "han", password: "hnasty")
Menu.create(name: "Han Dynasty", 
			description: "Han Dynasty is Philadelphia's home for authentic Szechuan cuisine. Accept no substitutes.",
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
			course1: "appetizers",
			course2: "noodles",
			course3: "entrees",
			course4: "specials",
			owner_id: 1)

Dish.create(name: "Dumplings in Chili Oil", description: "", price: 10.00, course: 1, menu_id: 1)
Dish.create(name: "Spicy Cucumbers", description: "", price: 10.00, course: 1, menu_id: 1)
Dish.create(name: "Dan Dan Noodles", description: "Spicy, nutty beggar's noodles topped with minced pork", price: 7.95, course: 2, menu_id: 1)
Dish.create(name: "Cold Rice Noodles", description: "", price: 7.95, course: 2, menu_id: 1)
Dish.create(name: "Double Cooked Chicken", description: "Tender chicken tossed with leeks, hot peppers, black beans, and chili oil", price: 12.95, course: 3, menu_id: 1)
Dish.create(name: "Garlic Style Chicken", description: "", price: 12.95, course: 3, menu_id: 1)
Dish.create(name: "Hot Pot Style", description: "", price: 12.95, course: 4, menu_id: 1)
Dish.create(name: "Roasted Duck", description: "", price: 12.95, course: 4, menu_id: 1)

# add second owner, menu, and two dishes
Owner.create(username: "pat", password: "king")
Menu.create(name: "Pat's King of Steaks", 
			description: "The originator and inventor of the steak and cheesesteak sandwiches, Pat's King of Steaks has been owned and operated by the Olivieri family for over 80 years.",
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
			course1: "steaks",
			course2: "hoagies",
			course3: "sides",
			course4: "specials",
			owner_id: 2)

Dish.create(name: "Cheesesteak", description: "The best cheesesteak ever. Comes with choice of American, Provolone, or Whiz. With or without onions. Hurry up!", price: 10.00, course: 1, menu_id: 2)
Dish.create(name: "Chicken Cheesesteak", description: "The chicken version of the best cheesesteak ever. Comes with choice of American, Provolone, or Whiz. With or without onions.", price: 9.50, course: 1, menu_id: 2)
Dish.create(name: "Italian Hoagie", description: "", price: 10.00, course: 2, menu_id: 2)
Dish.create(name: "Jersey Hoagie", description: "", price: 10.00, course: 2, menu_id: 2)
Dish.create(name: "French Fries", description: "", price: 10.00, course: 3, menu_id: 2)
Dish.create(name: "Cheese Fries", description: "", price: 10.00, course: 3, menu_id: 2)
Dish.create(name: "Pizza Blaster", description: "", price: 10.00, course: 4, menu_id: 2)
Dish.create(name: "Whiz Volcano", description: "", price: 10.00, course: 4, menu_id: 2)

# add third owner, menu, and two dishes
Owner.create(username: "mark", password: "italian")
Menu.create(name: "Vetri", 
			description: "Originally opened and operated with a more traditional a la carte menu, Vetri moved to a tasting menu-only format to fully showcase the constantly evolving, dynamic creativity of Chef Vetri and his kitchen staff, and their desire to offer an unparalleled dining experience. Upon arriving at their table, guests are treated as they would be in Italy and are eased into dinner with a selection of stuzzichini (hors d’oeuvres). With palates and stomachs primed, menus arrive—Di Pesce (fish), Di Verdure (vegetable), Di Terra (from the earth) and Dolce (dessert)—allowing for both the perusal of the season’s best offerings, and a conversation between guests and the restaurant’s staff to shape the meal.",
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
			course1: "antipasti",
			course2: "pasta",
			course3: "secondi",
			course4: "dolci",
			owner_id: 3)

Dish.create(name: "Farinata with Pistachio", description: "", price: 24.00, course: 1, menu_id: 3)
Dish.create(name: "Tuna crudo", description: "", price: 24.00, course: 1, menu_id: 3)
Dish.create(name: "Spinach gnocchi with brown butter", description: "Soft dough dumplings in a rich brown butter sauce", price: 24.00, course: 2, menu_id: 3)
Dish.create(name: "Almond tortellini with truffle sauce", description: "Handmade tortellini filled with almond paste and vegetables", price: 22.00, course: 2, menu_id: 3)
Dish.create(name: "Roasted Guinea Hen", description: "", price: 24.00, course: 3, menu_id: 3)
Dish.create(name: "Salt Baked Branzino", description: "", price: 24.00, course: 3, menu_id: 3)
Dish.create(name: "Chocolate Polenta Souffle", description: "", price: 24.00, course: 4, menu_id: 3)
Dish.create(name: "Coffee Panna Cotta", description: "", price: 24.00, course: 4, menu_id: 3)

# add fourth owner, menu, and two dishes
Owner.create(username: "rich", password: "veggie")
Menu.create(name: "Vedge", 
			description: "Opened in Fall 2011, Vedge is a vegetable restaurant by Chefs Richard Landau & Kate Jacoby. Located in the historic Tiger Building on Locust Street, Vedge offers a classically elegant dining experience with a progressive, bold approach to cooking. The menus at Vedge are putting vegetables in the spotlight, featuring locally sourced and seasonal ingredients. Absolutely no animal products are used in the Vedge Kitchen. Behind the bar, our cocktails are fun and innovative, using house-made syrups and bitters. Our wines and beers are selected to represent the best of the natural and craft movements. Vedge prides itself on being a foodie's restaurant – for omnivores, vegetarians, vegans, and carnivores alike.",
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
			course1: "the vedge bar",
			course2: "hot kitchen",
			course3: "the dirt list",
			course4: "specials",
			owner_id: 4)

Dish.create(name: "Stuffed avocado", description: "pickled cauliflower, romesco, 'fried rice', black salt", price: 11.00, course: 1, menu_id: 4)
Dish.create(name: "Fancy radishes", description: "jerk cashews, pickled red onion, brown bread", price: 10.00, course: 1, menu_id: 4)
Dish.create(name: "Grilled seitan", description: "Horseradish, pickled cherry, charred kohirabi slaw", price: 16.00, course: 2, menu_id: 4)
Dish.create(name: "Wood roasted carrot", description: "kimchee reuben, pumpernickel, sauerkraut puree", price: 14.00, course: 2, menu_id: 4)
Dish.create(name: "Hakurei turnips", description: "black truffle, black garlic", price: 8.00, course: 3, menu_id: 4)
Dish.create(name: "Greens", description: "smoked onion dashi, honshimeji mushrooms", price: 8.00, course: 3, menu_id: 4)
Dish.create(name: "Nebrodini mushrooms", description: "as 'fazzoletti', basil, charred tomato", price: 9.00, course: 4, menu_id: 4)
Dish.create(name: "Fingerling potatoes", description: "creamy worcestershire", price: 8.00, course: 4, menu_id: 4)

# add several reviews
Review.create(user_id: 1, dish_id: 3, menu_id: 1, title: "The Szechuan king of Philly!", description: "Seriously one of my favorite things to eat in the city. Caution: can be surprisingly spicy!", rating: 5)
Review.create(user_id: 2, dish_id: 3, menu_id: 1, title: "Come prepared for spicyness", description: "Very good usually, but it can be inconsistent in spicyness. A solid choice at Han Dynasty.", rating: 4)
Review.create(user_id: 3, dish_id: 3, menu_id: 1, title: "Overrated Chinese food", description: "Tastes like mushy peanut butter. Gross. Next please!", rating: 1)
Review.create(user_id: 4, dish_id: 3, menu_id: 1, title: "The BEST noodle spot", description: "Omg - looooove the dan dan!", rating: 5)
Review.create(user_id: 1, dish_id: 5, menu_id: 1, title: "The Szechuan king of Philly!", description: "Probably my favorite entree on the menu. Spicy, light, fresh, and accessible to Szechuan newbies.", rating: 5)
Review.create(user_id: 3, dish_id: 5, menu_id: 1, title: "Overrated Chinese food", description: "Acceptable until I ate a pepper and nearly choked. Should come with a warning label.", rating: 2)
Review.create(user_id: 1, dish_id: 9, menu_id: 2, title: "Overhyped tourist trap", description: "I seriously don't understand the hype about this cheesesteak. It's OK. Not worth waiting in line for, though.", rating: 3)
Review.create(user_id: 3, dish_id: 9, menu_id: 2, title: "Stay away!", description: "Wouldn't feed this to my worst enemy. Hot garbage.", rating: 1)
Review.create(user_id: 4, dish_id: 9, menu_id: 2, title: "A Philadelphia institution. Not bad!", description: "Not bad, but there are better cheesesteaks in the city.", rating: 3)
Review.create(user_id: 1, dish_id: 10, menu_id: 2, title: "Overhyped tourist trap", description: "This was actually a really tasty sandwich, probably better than the famous original cheesesteak.", rating: 3)
Review.create(user_id: 2, dish_id: 10, menu_id: 2, title: "You gotta try Pat's at least once.", description: "Pretty good stuff, but I'd strongly recommend getting provolone. Stay away from the whiz on this one!", rating: 3)
Review.create(user_id: 1, dish_id: 19, menu_id: 3, title: "Perfect Valentine's Night", description: "I still dream about this dish. You will never think of gnocchi in the same way after experiencing it in the rich brown butter. Get a reservation right now!", rating: 4)
Review.create(user_id: 2, dish_id: 20, menu_id: 3, title: "Best italian in the city", description: "An outstanding dish. The almonds and truffle were perfectly balanced and just left me wanting more.", rating: 5)
Review.create(user_id: 3, dish_id: 27, menu_id: 4, title: "Vegetarian paradise", description: "This was easily the best seitan I've ever had. The texture was sublime. Who needs meat when you have Vedge?", rating: 5)
Review.create(user_id: 4, dish_id: 28, menu_id: 4, title: "Brilliant take on veggies", description: "You might think that ordering a carrot as an entree is bizarre (well, I did), but have no fear. This dish was so suprisingly satisfying that I can't wait to order it again! ", rating: 4)

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
