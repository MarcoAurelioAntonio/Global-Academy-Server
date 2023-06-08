class Course < ApplicationRecord
  has_many :reservations
  validates :name, presence: true, length: { minimum: 10 } , uniqueness: true
  validates :description, presence: true, length: { minimum: 30 }
  validates :price, presence: true,numericality: { greater_than_or_equal_to: 0 }
  validates :type, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
end
