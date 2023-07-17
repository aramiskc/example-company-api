class Employee < ApplicationRecord
  validates :first_name, :last_name, :email, :phone, :job_title, presence: true
  belongs_to :department
end
