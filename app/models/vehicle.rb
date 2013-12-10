class Vehicle < ActiveRecord::Base
  belongs_to :user
  attr_accessible :license_plate, :colour, :make, :model, :year

  validates :license_plate, :make, presence: true
  validates :year, numericality: { only_integers: true }, length: { is: 4, message: "invalid year" }
end