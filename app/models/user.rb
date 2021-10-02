class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :last_namej, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/}
  validates :first_namej, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/}
  validates :last_namek, presence: true, format: {with: /\A[ァ-ヶー－]+\z/}
  validates :first_namek, presence: true, format: {with: /\A[ァ-ヶー－]+\z/}
  validates :birthday, presence: true
  validates :password, format: {with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]/}

  has_many :items
end
