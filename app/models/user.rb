class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  ATTRIBUTES = [:name, :email, :phone_number, :address, :province, :password,
    :password_confirmation, :current_password]
end
