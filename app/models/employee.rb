class Employee < ActiveRecord::Base
	validates :full_name, uniqueness: true
	validates :status, presence: true
end
