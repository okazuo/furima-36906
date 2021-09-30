class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :last_namej, presence: true
  validates :first_namej, presence: true
  validates :last_namek, presence: true
  validates :first_namek, presence: true
  validates :birthday, presence: true

  has_many :items
end
