class Delivery < ApplicationRecord

  with_options presence: true do
    validates :postal_number, format: {with:  /\A[0-9]{3}-[0-9]{4}\z/, length: {other_than: 8}}
    validates :prefecture_id,  numericality: {other_than: 0}
    validates :municipality
    validates :lot_number
    validates :telephone
  end

  belongs_to :order
end
