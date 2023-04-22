require 'rails_helper'

RSpec.describe PayFormPurchaseForm, type: :model do
  describe '購入情報の保存' do
    before do
      item = FactoryBot.create(:item)
      @pay_form_purchase_form = FactoryBot.build(:pay_form_purchase_form, user_id: item.user_id, item_id: item.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@pay_form_purchase_form).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @pay_form_purchase_form.building = ''
        expect(@pay_form_purchase_form).to be_valid
      end
    end

    context '内容に問題ある場合' do
      it 'postal_codeが空では登録できない' do
        @pay_form_purchase_form.postal_code = ''
        @pay_form_purchase_form.valid?
        expect(@pay_form_purchase_form.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @pay_form_purchase_form.postal_code = '1234567'
        @pay_form_purchase_form.valid?
        expect(@pay_form_purchase_form.errors.full_messages).to include('Postal code is invalid. Enter it as follows (e.g. 123-4567)')
      end
      it 'prefectureを選択していないと保存できないこと' do
        @pay_form_purchase_form.prefecture_id = 1
        @pay_form_purchase_form.valid?
        expect(@pay_form_purchase_form.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空では登録できない' do
        @pay_form_purchase_form.city = ''
        @pay_form_purchase_form.valid?
        expect(@pay_form_purchase_form.errors.full_messages).to include("City can't be blank")
      end
      it 'addressesが空では登録できない' do
        @pay_form_purchase_form.addresses = ''
        @pay_form_purchase_form.valid?
        expect(@pay_form_purchase_form.errors.full_messages).to include("Addresses can't be blank")
      end
      it 'phone_numberが空では登録できない' do
        @pay_form_purchase_form.phone_number = ''
        @pay_form_purchase_form.valid?
        expect(@pay_form_purchase_form.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが10桁未満では登録できない' do
        @pay_form_purchase_form.phone_number = '1111'
        @pay_form_purchase_form.valid?
        expect(@pay_form_purchase_form.errors.full_messages).to include('Phone number is too short')
      end
      it 'phone_numberが11桁超過では登録できない' do
        @pay_form_purchase_form.phone_number = '1111111111111'
        @pay_form_purchase_form.valid?
        expect(@pay_form_purchase_form.errors.full_messages).to include('Phone number is too short')
      end
      it 'phone_numberが全角数値では登録できない' do
        @pay_form_purchase_form.phone_number = '１１１１１１１１１１'
        @pay_form_purchase_form.valid?
        expect(@pay_form_purchase_form.errors.full_messages).to include('Phone number is invalid. Input only number')
      end
      it 'userが紐付いていないと保存できないこと' do
        @pay_form_purchase_form.user_id = nil
        @pay_form_purchase_form.valid?
        expect(@pay_form_purchase_form.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @pay_form_purchase_form.item_id = nil
        @pay_form_purchase_form.valid?
        expect(@pay_form_purchase_form.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが空では登録できないこと' do
        @pay_form_purchase_form.token = nil
        @pay_form_purchase_form.valid?
        expect(@pay_form_purchase_form.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
