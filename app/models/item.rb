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


  VALID_PRICEL_HALF =                 /\A[0-9]+\z/

  validates :image, presence: true
  validates :product_name, presence: true
  validates :discription, presence: true
  validates :category, presence: true
  validates :status, presence: true
  validates :delivery_fee, presence: true
  validates :prefecture, presence: true
  validates :day, presence: true
  validates :price, presence: true

  validates  :price,  presence: true, format: {with: VALID_PRICEL_HALF}, numericality: { only_integer: true,
    greater_than: 300, less_than: 10000000
    }

end