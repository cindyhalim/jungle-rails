class User < ActiveRecord::Base
  has_secure_password
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password_confirmation, presence: true
  validates :password, :presence => true, :length => {:minimum => 8}
  validates :email, :presence => true, uniqueness: { case_sensitive: false }

end

