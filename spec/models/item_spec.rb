require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品できる場合' do
      it 'image. name, info, price, category_id, sales_status_id, shipping_fee_status_id, prefecture_id, scheduled_delivery_idが存在していれば保存できる' do
        expect(@item).to be_valid
      end
    end
    context '商品出品できない場合' do
      it 'imageが空では保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空では保存できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'nameが40字超過では保存できない' do
        @item.name = Faker::Lorem.characters(number: 41)
        @item.valid?
        expect(@item.errors.full_messages).to include('Name is too long (maximum is 40 characters)')
      end
      it 'infoが空では保存できない' do
        @item.info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Info can't be blank")
      end
      it 'infoが1,000字超過では保存できない' do
        @item.info = Faker::Lorem.characters(number: 1001)
        @item.valid?
        expect(@item.errors.full_messages).to include('Info is too long (maximum is 1000 characters)')
      end
      it 'categoryが空では保存できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank", 'Category is not a number')
      end
      it 'category_idが"---"では保存できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
      it 'sales_statusが空では保存できない' do
        @item.sales_status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Sales status can't be blank", 'Sales status is not a number')
      end
      it 'sales_statusが"---"では保存できない' do
        @item.sales_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Sales status must be other than 1')
      end
      it 'shipping_fee_statusが空では保存できない' do
        @item.shipping_fee_status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee status can't be blank", 'Shipping fee status is not a number')
      end
      it 'shipping_fee_statusが"---"では保存できない' do
        @item.shipping_fee_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping fee status must be other than 1')
      end
      it 'prefectureが空では保存できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank", 'Prefecture is not a number')
      end
      it 'prefectureが"---"では保存できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it 'scheduled_deliveryが空では保存できない' do
        @item.scheduled_delivery_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Scheduled delivery can't be blank", 'Scheduled delivery is not a number')
      end
      it 'scheduled_deliveryが"---"では保存できない' do
        @item.scheduled_delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Scheduled delivery must be other than 1')
      end
      it 'priceが空では保存できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが¥300未満では保存できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid. Input half-width characters')
      end
      it 'priceが¥9,999,999超過では保存できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid. Input half-width characters')
      end
      it 'priceが全角では保存できない' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid. Input half-width characters')
      end
      it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
