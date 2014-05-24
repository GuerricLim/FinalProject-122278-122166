class EmployeesController < ApplicationController
	def index
		@employees =Employee.all
	end
	def new
		@employee = Employee.new
	end 
	def create
		@employee = Employee.new(employee_params)
		if @employee.save
			redirect_to employees_path
		else
			@message = @employee.errors.messages
			render :new
		end
	end
	def edit
		@employee = Employee.find(params[:id])
	end

	def update
		@employee = Employee.find(params[:id])
		if @employee.update(employee_params)
			redirect_to employees_path
		else
			@message = @employee.errors.messages
			render :edit
		end
	end
	def destroy
		@employee = Employee.find(params[:id])
		@employee.destroy
		redirect_to employees_path
	end

	def show
		@employee = Employee.find(params[:id])
		@tax_witheld = 0
		@tax = 0
		@days = 314 - @employee.absences
		@salary = @employee.salary_per_day*@days
		@total_salary = @salary/12*@employee.number_of_months
		if @employee.number_of_months.to_i%12 != 0 
			if @employee.dependents == 0
				if @salary/12 <= 4167
					@tax_witheld = 0
				elsif @salary/12 < 5000
					@tax_witheld = (@salary/12-4167)*0.05
				elsif @salary/12 == 5000
					@tax_witheld = 41.67
				elsif @salary/12 <6667
					@tax_witheld = 41.67 + (@salary/12-5000)*0.1
				elsif @salary/12 == 6667
					@tax_witheld = 208.33
				elsif @salary/12 <10000
					@tax_witheld = 208.33+(@salary/12 - 6667)*0.15
				elsif @salary/12 == 10000
					@tax_witheld = 708.33
				elsif @salary/12 <15833
					@tax_witheld = 708.33+ (@salary/12 - 10000)*0.2
				elsif @salary/12 ==15833
					@tax_witheld = 1875
				elsif @salary/12 <25000
					@tax_witheld = 1875 + (@salary/12-15833)*0.25
				elsif @salary/12 == 25000
					@tax_witheld = 4166.67
				elsif @salary/12 <45833
					@tax_witheld = 4166.67 + (@salary/12-25000)*0.3
				elsif @salary/12 == 45833
					@tax_witheld = 10416.67
				else
					@tax_witheld = 10416.67 +(@salary/12-45833)*0.32
				end
			elsif @employee.dependents == 1
				if @salary/12 <= 6250
					@tax_witheld = 0
				elsif @salary/12 < 7083
					@tax_witheld = (@salary/12-6250)*0.05
				elsif @salary/12 == 7083
					@tax_witheld = 41.67
				elsif @salary/12 <8750
					@tax_witheld = 41.67 + (@salary/12-7083)*0.1
				elsif @salary/12 == 8750
					@tax_witheld = 208.33
				elsif @salary/12 <12083
					@tax_witheld = 208.33+(@salary/12 - 8750)*0.15
				elsif @salary/12 == 12083
					@tax_witheld = 708.33
				elsif @salary/12 <17917
					@tax_witheld = 708.33+ (@salary/12 - 12083)*0.2
				elsif @salary/12 ==17197
					@tax_witheld = 1875
				elsif @salary/12 <27083
					@tax_witheld = 1875 + (@salary/12-17917)*0.25
				elsif @salary/12 == 27083
					@tax_witheld = 4166.67
				elsif @salary/12 <47197
					@tax_witheld = 4166.67 + (@salary/12-27083)*0.3
				elsif @salary/12 == 47917
					@tax_witheld = 10416.67
				else
					@tax_witheld = 10416.67 +(@salary/12-47917)*0.32
				end
			elsif @employee.dependents ==2 
				if @salary/12 <= 8333
					@tax_witheld = 0
				elsif @salary/12 < 9167
					@tax_witheld = (@salary/12-8333)*0.05
				elsif @salary/12 == 9167
					@tax_witheld = 41.67
				elsif @salary/12 <10833
					@tax_witheld = 41.67 + (@salary/12-9167)*0.1
				elsif @salary/12 == 10833
					@tax_witheld = 208.33
				elsif @salary/12 <14167
					@tax_witheld = 208.33+(@salary/12 - 10833)*0.15
				elsif @salary/12 == 14167
					@tax_witheld = 708.33
				elsif @salary/12 <20000
					@tax_witheld = 708.33+ (@salary/12 - 14167)*0.2
				elsif @salary/12 ==20000
					@tax_witheld = 1875
				elsif @salary/12 <29167
					@tax_witheld = 1875 + (@salary/12-20000)*0.25
				elsif @salary/12 == 29167
					@tax_witheld = 4166.67
				elsif @salary/12 <50000
					@tax_witheld = 4166.67 + (@salary/12-29167)*0.3
				elsif @salary/12 == 50000
					@tax_witheld = 10416.67
				else
					@tax_witheld = 10416.67 +(@salary/12-50000)*0.32
				end
			elsif @employee.dependents ==3 
				if @salary/12 <= 10417
					@tax_witheld = 0
				elsif @salary/12 < 11250
					@tax_witheld = (@salary/12-10417)*0.05
				elsif @salary/12 == 11250
					@tax_witheld = 41.67
				elsif @salary/12 <12917
					@tax_witheld = 41.67 + (@salary/12-11250)*0.1
				elsif @salary/12 == 12917
					@tax_witheld = 208.33
				elsif @salary/12 <16250
					@tax_witheld = 208.33+(@salary/12 - 12917)*0.15
				elsif @salary/12 == 16250
					@tax_witheld = 708.33
				elsif @salary/12 <22083
					@tax_witheld = 708.33+ (@salary/12 - 16250)*0.2
				elsif @salary/12 ==22083
					@tax_witheld = 1875
				elsif @salary/12 <31250
					@tax_witheld = 1875 + (@salary/12-22083)*0.25
				elsif @salary/12 == 31250
					@tax_witheld = 4166.67
				elsif @salary/12 <52083
					@tax_witheld = 4166.67 + (@salary/12-31250)*0.3
				elsif @salary/12 == 52083
					@tax_witheld = 10416.67
				else
					@tax_witheld = 10416.67 +(@salary/12-52083)*0.32
				end
			else
				if @salary/12 <= 12500
					@tax_witheld = 0
				elsif @salary/12 < 13333
					@tax_witheld = (@salary/12-12500)*0.05
				elsif @salary/12 == 13333
					@tax_witheld = 41.67
				elsif @salary/12 <15000
					@tax_witheld = 41.67 + (@salary/12-13333)*0.1
				elsif @salary/12 == 15000
					@tax_witheld = 208.33
				elsif @salary/12 <18333
					@tax_witheld = 208.33+(@salary/12 - 15000)*0.15
				elsif @salary/12 == 18333
					@tax_witheld = 708.33
				elsif @salary/12 <24167
					@tax_witheld = 708.33+ (@salary/12 - 18333)*0.2
				elsif @salary/12 ==24167
					@tax_witheld = 1875
				elsif @salary/12 <33333
					@tax_witheld = 1875 + (@salary/12-24167)*0.25
				elsif @salary/12 == 33333
					@tax_witheld = 4166.67
				elsif @salary/12 <54167
					@tax_witheld = 4166.67 + (@salary/12-33333)*0.3
				elsif @salary/12 == 54167
					@tax_witheld = 10416.67
				else
					@tax_witheld = 10416.67 +(@salary/12-54167)*0.32
				end
			end
			if @employee.number_of_months >= 12
				if @salary <= 10000
			@tax = @salary*0.05
		elsif @salary>10000 && @salary<=30000
			@tax = (500+0.10*(@salary-10000))
		elsif @salary>30000 && @salary<=70000
			@tax = (2500 + 0.15*(@salary-30000))
		elsif @salary>70000 && @salary<=140000
			@tax = (8500 +0.20*(@salary-70000))
		elsif @salary>140000 && @salary<=250000
			@tax = (22500 + 0.25*(@salary-140000))
		elsif @salary>250000 && @salary <=500000
			@tax = (50000 + 0.3*(@salary-250000))
		else
			@tax = (125000 + 0.32*(@salary-500000))
		end
	end
		else
		if @salary <= 10000
			@tax = @salary*0.05
		elsif @salary>10000 && @salary<=30000
			@tax = (500+0.10*(@salary-10000))
		elsif @salary>30000 && @salary<=70000
			@tax = (2500 + 0.15*(@salary-30000))
		elsif @salary>70000 && @salary<=140000
			@tax = (8500 +0.20*(@salary-70000))
		elsif @salary>140000 && @salary<=250000
			@tax = (22500 + 0.25*(@salary-140000))
		elsif @salary>250000 && @salary <=500000
			@tax = (50000 + 0.3*(@salary-250000))
		else
			@tax = (125000 + 0.32*(@salary-500000))
		end
	end
	if @employee.number_of_months % 12 == 0
		@net_salary = @total_salary - @tax*(@employee.number_of_months/12)
	else
		if @employee.number_of_months>=12
			@net_salary = @total_salary-@tax_witheld*((@employee.number_of_months.to_i)%12)-@tax*(@employee.number_of_months.to_i/12)
		else
			@net_salary = @total_salary-@tax_witheld*((@employee.number_of_months.to_i)%12)
		end
	end
		render :show 
		
	end
def employee_params
		params.require(:employee).permit!
	end
end
