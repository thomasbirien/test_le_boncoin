class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # has_many :items
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone_number, presence: true
  validates :civility, presence: true
  validates :address, presence: true
  validates :post_code, presence: true
  validates :city, presence: true
  validates :country, presence: true
  validates :status, presence: true

end
