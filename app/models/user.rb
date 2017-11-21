class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_many :articles
  has_many :permissions
  has_many :roles, through: :permissions

  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  def role?(role)
    self.roles.pluck(:name).include?role
  end

end
