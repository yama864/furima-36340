require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe 'ユーザー新規登録' do
    context '内容に問題ない場合' do
      it '全ての項目が入力されていれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it '画像の添付が無いと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空欄だと出品できない' do
        @item.product_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product name can't be blank")
      end
      it '商品説明が空欄だと出品できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'カテゴリーを選択していなければ出品できない' do
        @item.category_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態を選択していなければ出品できない' do
        @item.status_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it '発送元の都道府県を選択していなければ出品できない' do
        @item.shipping_area_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area can't be blank")
      end
      it '発送までの日数を選択していなければ出品できない' do
        @item.ship_time_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship time can't be blank")
      end
      it '価格の入力がなければ出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格が300円未満だと出品できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it '価格が9,999,999円以上だと出品できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
      it '価格は半角数字のみ保存可能' do
        @item.price = '５００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
    end
  end
end
