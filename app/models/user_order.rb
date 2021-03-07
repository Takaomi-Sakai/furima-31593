class UserOrder
  include ActiveModel::Model
  attr_accessor :postalcode,:prefecture_id, :maincipality, :address, :building, :phone, :purchase_record, :user_id, :item_id

  # model/purchaseのバリデーション
  with_options presence: true do
    validates :postalcode
    validates :prefecture_id
    validates :maincipality
    validates :address
    validates :phone
  end

  validates_format_of :postalcode, with: /\A\d{3}[-]\d{4}\z/, message: '例) 123-4567'
  validates_format_of :phone, with: /\A\d{10,11}\z/, message: '例) 09012345678'

# model/purchase_recordのバリデーション
  with_options presence: true do
    validates :user_id
    validates :item_id
  end

  def save
    # 購入記録の情報を保存
    purchase_record = PurchaseRecord.create(user_id: user_id, item_id: item_id)

    # 購入の情報を保存
    Purchase.create(postalcode: postalcode, prefecture_id: prefecture_id, maincipality: maincipality, address: address, building: building,phone: phone, purchase_record_id: purchase_record.id)
  end
end