class Token < ApplicationRecord
  belongs_to :user
  belongs_to :seller
  validates :phoneno, presence: true , length: {minimum:10, maximum:10}
end
