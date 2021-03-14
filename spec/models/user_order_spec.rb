require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  before do
    @user_order = FactoryBot.build(:user_order)
  end

  describe '商品購入機能' do
    context '商品購入ができる場合' do
      it 'postalcode, prefecture_id, maincipality, address, building, phone, purchase_record, user_id, item_id, tokenが存在すれば商品購入できる' do
        expect(@user_order).to be_valid
      end

      it '郵便番号にハイフンあれば商品購入ができる' do
        @user_order.postalcode = '123-4567'
        expect(@user_order).to be_valid
      end

      it '電話番号にハイフンがなく、11桁以内あれば商品購入ができる' do
        @user_order.phone = '09012345678'
        expect(@user_order).to be_valid
      end

      it '建物名がなくても商品購入ができる' do
        @user_order.building = ''
        expect(@user_order).to be_valid
      end

    end
  end

  context '商品購入できない場合' do
    it 'postalcodeが空では登録できない' do
      @user_order.postalcode = ''
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include "Postalcode can't be blank"
    end

    it 'prefecture_idが空では商品購入できない' do
      @user_order.prefecture_id = ''
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include "Prefecture can't be blank"
    end

    it 'maincipalityが空では商品購入できない' do
      @user_order.maincipality = ''
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include "Maincipality can't be blank"
    end

    it 'addressが空では商品購入できない' do
      @user_order.address = ''
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include "Address can't be blank"
    end

    it 'phoneが空では商品購入できない' do
      @user_order.phone = ''
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include "Phone can't be blank"
    end

    it 'postalcodeは-を含まなければ商品購入できない' do
      @user_order.postalcode = '1234567'
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include 'Postalcode Postal code Input correctly'
    end

    it 'phoneは12桁では商品購入できない' do
      @user_order.phone = '090123456789'
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include 'Phone is invalid'
    end

    it 'tokenが空では商品購入できないこと' do
      @user_order.token = ''
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Token can't be blank")
    end

    it 'prefecture_idが1では商品購入できない' do
      @user_order.prefecture_id = 1
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include ("Prefecture must be greater than 1")
    end

    it 'user_idが空では商品購入できないこと' do
      @user_order.user_id = ''
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("User can't be blank")
    end
    
    it 'item_idが空では商品購入できないこと' do
      @user_order.item_id = ''
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Item can't be blank")
    end

  end
end
