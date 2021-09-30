class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validatable :nickname, presence :true
  validatable :last_namej, presence :true
  validatable :first_namej, presence :true
  validatable :last_namek, presence :true
  validatable :first_namek, presence :true
  validatable :birthday, presence :true

  has_many :items
end
