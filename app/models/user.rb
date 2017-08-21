class User < ApplicationRecord
has_many :photos
has_many :comments
	def self.auth(name, password)
		user = User.find_by_name(name)
		user1 = User.find_by_password(password)
		if user == user1
			user
		else
			nil
		end

	end
end
