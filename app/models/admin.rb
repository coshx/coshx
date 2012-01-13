class Admin < ActiveRecord::Base
  devise :database_authenticatable, :recoverable,
    :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name

  has_many :posts, :foreign_key => "author_id"
end
