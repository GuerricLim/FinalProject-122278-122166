class PagesController < ApplicationController
	def index
		@latest_employees = Employee.last(5)
	end
	def about
	end
end
