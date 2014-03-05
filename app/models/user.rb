class User < ActiveRecord::Base
  DefaultName = "USER NAME NOT SET"

  attr_accessor :password
  before_save :encrypt_password

  validates_presence_of :password, on: :create
  validates :password, length: {minimum: 8}, confirmation: true, if: "password.present?"

  validates :email,     presence: true, uniqueness: true, email: true
  validates :name,      presence: true

  def set_random_password
  	self.password = Chatty::Services.random_alphanum(12)
  	self.password_confirmation = self.password 
  end
  
  def set_default_name
    self.name = DefaultName
  end
  
  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  def self.setup?
    User.first.present?
  end
  
  private      
  
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end               