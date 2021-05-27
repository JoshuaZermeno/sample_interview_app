class Employee < ApplicationRecord
  include Taggable
  has_many :employees_addresses
  has_many :addresses, through: :employees_addresses

  taggable_data :department_name
  validates :internal_employee_id, presence: true, length: { maximum: 37 }

  after_create :tag_with_department_name
end
