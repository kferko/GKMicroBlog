class User < ActiveRecord::Base
  has_many :reviews
end

class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :dish
end

class Owner < ActiveRecord::Base
  has_one :menu
end

class Menu < ActiveRecord::Base
  belongs_to :owner
  has_many :dishes
end

class Dish < ActiveRecord::Base
  belongs_to :menu
  has_many :reviews
end
