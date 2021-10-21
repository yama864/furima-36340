require 'rails_helper'

RSpec.describe OrderPurchaseRecord, type: :model do
  before do
    @order_purchase_record = FactoryBot.build(:order_purchase_record)
  end

  context '内容に問題ない場合' do
    it '全ての入力があれば購入できる' do
      expect(@order_purchase_record).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it '郵便番号が空欄だと購入できない' do
      @order_purchase_record.postcode = ''
      @order_purchase_record.valid?
      expect(@order_purchase_record.errors.full_messages).to include("Postcode can't be blank")
    end
    it '郵便番号に「-」が含まれていないと購入できない' do
      @order_purchase_record.postcode = '1112222'
      @order_purchase_record.valid?
      expect(@order_purchase_record.errors.full_messages).to include('Postcode is invalid. Include hyphen(-)')
    end
    it '都道府県を選択していないと購入できない' do
      @order_purchase_record.region_id = '0'
      @order_purchase_record.valid?
      expect(@order_purchase_record.errors.full_messages).to include("Region can't be blank")
    end
    it '市区町村を入力していないと購入できない' do
      @order_purchase_record.city = ''
      @order_purchase_record.valid?
      expect(@order_purchase_record.errors.full_messages).to include("City can't be blank")
    end
    it '番地を入力していないと購入できない' do
      @order_purchase_record.street = ''
      @order_purchase_record.valid?
      expect(@order_purchase_record.errors.full_messages).to include("Street can't be blank")
    end
    it '電話番号を入力していないと購入できない' do
      @order_purchase_record.phone_number = ''
      @order_purchase_record.valid?
      expect(@order_purchase_record.errors.full_messages).to include("Phone number can't be blank")
    end
    it '電話番号は10桁以上11桁以内で入力していないと購入できない' do
      @order_purchase_record.phone_number = '123456789'
      @order_purchase_record.valid?
      expect(@order_purchase_record.errors.full_messages).to include('Phone number is invalid')
    end
    it '電話番号は半角数値で入力していないと購入できない' do
      @order_purchase_record.phone_number = '０９０１１１１２２２２'
      @order_purchase_record.valid?
      expect(@order_purchase_record.errors.full_messages).to include('Phone number is invalid')
    end
    it 'クレジットカード情報を入力していないと購入できない' do
      @order_purchase_record.token = ''
      @order_purchase_record.valid?
      expect(@order_purchase_record.errors.full_messages).to include("Token can't be blank")
    end
  end
end
