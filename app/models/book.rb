class Book < ActiveRecord::Base
     has_many :orders
     has_many :captures

end
