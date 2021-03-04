class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase_record
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :day

  VALID_PRICEL_HALF = /\A[0-9]+\z/

  with_options presence: true do
    validates :image
    validates :product_name
    validates :discription
    validates :category_id
    validates :status_id
    validates :delivery_fee_id
    validates :prefecture_id
    validates :day_id
    validates :price
  end

  with_options numericality: { greater_than: 1 } do
    validates :category_id
    validates :status_id
    validates :delivery_fee_id
    validates :prefecture_id
    validates :day_id
  end

  validates :price, numericality: true

  validates :price, presence: true, format: { with: VALID_PRICEL_HALF }, numericality: { only_integer: true,
                                                                                         greater_than: 300, less_than: 10_000_000 }
end
