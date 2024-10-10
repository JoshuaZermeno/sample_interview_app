# Say we have a text field form that takes in a users input to
# search departments within a company and outputs the departments
# and employee data (in a messy fashion). This code is not ideal.
# What problems does it have and how can you improve it.
# 
# Tables/Models:
#  - Departments
#  - Employees
#  - Locations

@departments = Department.where(company: params[:company])

@departments.each do |department|
    puts "Department name is #{department.name}"
    puts "Department added to system on #{department.created_at}"

    department.employees.each do |employee|
        puts "Employee Name: #{employee.to_s}"
        puts "Employee Location: #{employee.location}"
    end
end