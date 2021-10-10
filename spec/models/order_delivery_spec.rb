require 'rails_helper'

RSpec.describe OrderDelivery, type: :model do
  before do
    user = FactoryBot.create(:user)
    @user = FactoryBot.create(:user)
    item = FactoryBot.build_stubbed(:item, user_id: user.id)
    @order_delivery = FactoryBot.build(:order_delivery, user_id: @user.id, item_id: item.id)
  end

  describe '購入記録' do
    context '内容に問題がない場合' do
      it '全ての値が正しく入力されていれば保存できる' do
        expect(@order_delivery).to be_valid
      end
      it 'buildingが空でも保存できる' do
        @order_delivery.building = ''
        expect(@order_delivery).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'tokenが空では登録できない' do
        @order_delivery.token = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_numberが空では登録できない' do
        @order_delivery.postal_number = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Postal number can't be blank")
      end
      it 'postal_numberが全角では登録できない' do
        @order_delivery.postal_number = '１２３−４５６７'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include('Postal number is invalid')
      end
      it 'postal_numberがハイフン抜きでは登録できない' do
        @order_delivery.postal_number = '1234567'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include('Postal number is invalid')
      end
      it 'postal_numberが123-4567の形式でなければ登録できない' do
        @order_delivery.postal_number = '1234-567'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include('Postal number is invalid')
      end
      it 'prefecture_idが1では登録できない' do
        @order_delivery.prefecture_id = '1'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it 'municipalityが空では登録できない' do
        @order_delivery.municipality = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'lot_numberが空では登録できない' do
        @order_delivery.lot_number = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Lot number can't be blank")
      end
      it 'telephoneが空では登録できない' do
        @order_delivery.telephone = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Telephone can't be blank")
      end
      it 'telephoneが9桁以下では登録できない' do
        @order_delivery.telephone = '123456789'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include('Telephone is too short (minimum is 10 characters)')
      end
      it 'telephoneに-があればでは登録できない' do
        @order_delivery.telephone = '012-456-789'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include('Telephone is not a number')
      end
      it '電話番号が英数混合では登録できない' do
        @order_delivery.telephone = '12345abcde'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include('Telephone is not a number')
      end
      it 'item_idが空では登録できない' do
        @order_delivery.item_id = nil
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Item can't be blank")
      end
      it 'user_idが空では登録できない' do
        @order_delivery.user_id = nil
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("User can't be blank")
      end
    end
  end
end