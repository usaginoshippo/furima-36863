require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '出品する' do
    context '品物を出品できる場合' do
      it '商品の画像, 商品名、商品の説明,カテゴリー情報,商品の状態,送料負担,発送料負担,発送元地域,
      発送までの日数,価格（半角数字,300円以上9999999円以内）の情報がある場合出品できる' do
        expect(@item).to be_valid
      end
    end
    context '品物を出品できない場合' do
      it '商品の画像がない場合出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名がない場合出品できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it '商品の説明がない場合出品できない' do
        @item.item_explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item explanation can't be blank")
      end
      it 'カテゴリー情報を選択していない場合出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態を選択していない場合出品できない' do
        @item.product_condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Product condition can't be blank")
      end
      it '送料負担を選択していない場合出品できない' do
        @item.ship_cost_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship cost can't be blank")
      end
      it '発送元地域を選択していない場合出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '発送までの日数を選択していない場合出品できない' do
        @item.ship_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship day can't be blank")
      end
      it '価格の情報がない場合出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格が全角だと出品できない' do
        @item.price = '１００００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it '価格が300円未満の場合は出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
      it '価格が9999999円より大きい場合は出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
      it 'ユーザーが紐づいていない場合は出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
