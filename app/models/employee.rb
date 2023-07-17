class Employee < ApplicationRecord
  validates :first_name, :last_name, :email, :phone, :job_title, :department_id, presence: true
  belongs_to :department
end
