class Role < ApplicationRecord
	has_many :users
	validates :roles, presence: true
    validates_uniqueness_of :roles

end
