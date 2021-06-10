class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :scheduled

  belongs_to :user
  has_one :order
  has_one_attached :image

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :shipping_fee_id
    validates :prefecture_id
    validates :scheduled_id
  end
  with_options presence: true do
    validates :title
    validates :text
    validates :image
  end
  validates :price, format: { with: /\A[0-9]+\z/ }, numericality: { greater_than_or_equal_to: 300, less_than: 10_000_000 }
end
