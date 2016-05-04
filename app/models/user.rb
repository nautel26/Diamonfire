class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable, authentication_keys: [:login]

  attr_accessor :login
  enum position: [:member, :admin]

  ATTRIBUTES = [:name, :username, :email, :phone_number, :address, :province, :password,
    :password_confirmation, :current_password]

  validates :username, presence: true, uniqueness: {case_sensitive: false}
  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, multiline: true

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end

  class << self
    def generate_position_collection
      positions.map do |position, _|
        [I18n.t("admin.users.position.#{position}"), position]
      end
    end
  end
end
