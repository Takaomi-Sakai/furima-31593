FactoryBot.define do
  factory :item do
    product_name          { '製品名' }
    discription           { '製品説明' }
    category_id           { 2 }
    status_id             { 2 }
    delivery_fee_id       { 2 }
    prefecture_id         { 2 }
    day_id                { 2 }
    price                 { 3000 }
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/apple-touch-icon.png'), filename: 'apple-touch-icon.png')
    end
  end
end
