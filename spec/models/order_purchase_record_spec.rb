require 'rails_helper'

RSpec.describe OrderPurchaseRecord, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order_purchase_record = FactoryBot.build(:order_purchase_record, user_id: @user.id, item_id: @item.id)
    sleep 0.1
  end

  context '内容に問題ない場合' do
    it '全ての入力があれば購入できる' do
      expect(@order_purchase_record).to be_valid
    end
    it '建物名は空でも購入できる' do
      @order_purchase_record.building = ''
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
    it '電話番号は10桁以下での入力だと購入できない' do
      @order_purchase_record.phone_number = '123456789'
      @order_purchase_record.valid?
      expect(@order_purchase_record.errors.full_messages).to include('Phone number is invalid')
    end
    it '電話番号は12桁以上での入力だと購入できない' do
      @order_purchase_record.phone_number = '123456789012'
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
    it 'user_idが空だと登録できない' do
      @order_purchase_record.user_id = ''
      @order_purchase_record.valid?
      expect(@order_purchase_record.errors.full_messages).to include("User can't be blank")
    end
    it 'item_idが空だと登録できない' do
      @order_purchase_record.item_id = ''
      @order_purchase_record.valid?
      expect(@order_purchase_record.errors.full_messages).to include("Item can't be blank")
    end
  end
end
