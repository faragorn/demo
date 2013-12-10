class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation
  attr_accessor :password
  before_save :encrypt_password

  validates :password, confirmation: true
  validates :password, :email, presence: true, :on => :create
  validates :email, uniqueness: true

  has_one :person, dependent: :destroy
  has_many :vehicles, dependent: :destroy

  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt) && user.activation_token == nil
      user
    else
      nil
    end
  end

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end