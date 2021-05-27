class EmployeesAddresses < ApplicationRecord
  belongs_to :employee
  belongs_to :address
end
