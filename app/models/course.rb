class Course < ApplicationRecord
  has_many :reservations, dependent: :destroy 
  validates :name, presence: true, length: { minimum: 3 }, uniqueness: true
  validates :description, presence: true, length: { minimum: 30 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :course_type, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
end
