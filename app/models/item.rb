class Item < ApplicationRecord

  validates :title, :price, :explanation, presence: true
  validates :category_id, :status_id, :postage_id, :prefecture_id, :period_id, numericality: { other_than: 1, message: "can't be blank"}
  
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :postage
  belongs_to :prefecture
  belongs_to :period
end
