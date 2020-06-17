class Token < ApplicationRecord
  belongs_to :user
  belongs_to :seller
  validates :phoneno, presence: true , length: {is: 10}
end
