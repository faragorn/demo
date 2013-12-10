class Person < ActiveRecord::Base
  belongs_to :user
  attr_accessible :first_name, :last_name, :city, :province, :address, :phone_number, :postal_code
  validates :phone_number, numericality: {only_integer: true, message: "Should contain numbers only"},
            length: { is: 10, message: "Should contain 10 numbers"}
  validates :postal_code, format: {with: /^([A-Za-z]\d){3}$/, message: "invalid postal code."},
      length: { is: 6}
  validates :first_name, :last_name, :address, :province, :postal_code, :city, :phone_number, presence: true
end