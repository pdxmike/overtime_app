class Hand < ActiveRecord::Base
	belongs_to :user
	belongs_to :hand, class_name: 'User'

end
