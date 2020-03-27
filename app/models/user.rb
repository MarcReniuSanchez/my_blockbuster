class User < ApplicationRecord

  validates :email, presence: true, length: { maximum: 50 }

end
