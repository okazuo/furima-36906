class Item < ApplicationRecord

  validates :title, presence: true
  validates :price, presence: true
  validates :explanation, presence: true
  validates :category_id, presence: true
  validates :status_id, presence: true
  validates :postage_id, presence: true
  validates :prefecture_id, presence: true
  validates :period_id, presence: true
  
  belongs_to :user
  has_one_attached :image
end
