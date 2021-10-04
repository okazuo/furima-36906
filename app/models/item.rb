class Item < ApplicationRecord
  validates :title, length: { maximum: 40 }, presence: true
  validates :explanation, length: { maximum: 1000 }, presence: true
  validates :image, presence: true
  validates :category_id, :status_id, :postage_id, :prefecture_id, :period_id,
            numericality: { other_than: 1, message: "can't be blank" }
  validates :price, presence: true, format: { with: /\A[0-9]+\z/ },
                    numericality: { greater_than: 299, less_than: 10_000_000, only_integer: true }

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :postage
  belongs_to :prefecture
  belongs_to :period
end
