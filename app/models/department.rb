class Department < ApplicationRecord
  validates :name, :manager, :code, presence: true
  has_many :employees
end
