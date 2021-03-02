require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  # pending "add some examples to (or delete) #{__FILE__}"

  describe '商品出品機能' do
    context '商品登録できる場合' do
      it 'product_name, discription, category_id, status_id, delivery_fee_id,
         prefecture_id, day_id, priceが存在すれば商品登録できる' do
        expect(@item).to be_valid
      end

      it '価格が、¥3000あれば商品登録ができる' do
        @item.price = '3000'
        expect(@item).to be_valid
      end

      it '価格が、¥9,999,999であれば商品登録ができる' do
        @item.price = '9999999'
        expect(@item).to be_valid
      end
    end

    context '商品登録できない場合' do
      it 'product_nameが空では登録できない' do
        @item.product_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Product name can't be blank"
      end

      it 'discriptionが空では登録できない' do
        @item.discription = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Discription can't be blank"
      end

      it 'category_idが空では登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end

      it 'status_idが空では登録できない' do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Status can't be blank"
      end

      it 'delivery_fee_idが空では登録できない' do
        @item.delivery_fee_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery fee can't be blank"
      end

      it 'prefecture_idが空では登録できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture can't be blank"
      end

      it 'day_idが空では登録できない' do
        @item.day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Day can't be blank"
      end

      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end

      it '価格が¥299では登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price must be greater than 300'
      end

      it '価格が¥10000000では登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price must be less than 10000000'
      end
    end
  end
end
