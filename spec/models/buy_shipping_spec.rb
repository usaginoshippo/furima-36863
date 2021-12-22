require 'rails_helper'

RSpec.describe BuyShipping, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      sleep(0.5)
      @buy_shipping = FactoryBot.build(:buy_shipping, user_id: user.id, item_id: item.id)
    end

    context '内容に問題がない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@buy_shipping).to be_valid
      end
      it 'buildingが空でも保存できること' do
        @buy_shipping.building = ''
        expect(@buy_shipping).to be_valid
      end
    end
    
    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できないこと' do
        @buy_shipping.postal_code = ''
        @buy_shipping.valid?
        expect(@buy_shipping.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが7桁でないと保存できないこと' do
        @buy_shipping.postal_code = '123-456'
        @buy_shipping.valid?
        expect(@buy_shipping.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'postal_codeがハイフンを含まないと保存できないこと' do
        @buy_shipping.postal_code = '1234567'
        @buy_shipping.valid?
        expect(@buy_shipping.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'prefectureを選択していないと保存できないこと' do
        @buy_shipping.prefecture_id = 1
        @buy_shipping.valid?
        expect(@buy_shipping.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと保存できないこと' do
        @buy_shipping.city = ''
        @buy_shipping.valid?
        expect(@buy_shipping.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numが空だと保存できないこと' do
        @buy_shipping.house_num = ''
        @buy_shipping.valid?
        expect(@buy_shipping.errors.full_messages).to include("House num can't be blank")
      end
      it 'tel_numが空だと保存できないこと' do
        @buy_shipping.tel_num = ''
        @buy_shipping.valid?
        expect(@buy_shipping.errors.full_messages).to include("Tel num can't be blank")
      end
      it 'tel_numが全角数字だと保存できないこと' do
        @buy_shipping.tel_num = '０１２３４５６７８９'
        @buy_shipping.valid?
        expect(@buy_shipping.errors.full_messages).to include("Tel num is invalid")
      end
      it 'tel_numが10桁未満だと保存できないこと' do
        @buy_shipping.tel_num = '123456789'
        @buy_shipping.valid?
        expect(@buy_shipping.errors.full_messages).to include("Tel num is invalid")
      end
      it 'tel_numが12桁以上だと保存できないこと' do
        @buy_shipping.tel_num = '012345678909'
        @buy_shipping.valid?
        expect(@buy_shipping.errors.full_messages).to include("Tel num is invalid")
      end
      it 'userが紐づいていないと保存できないこと' do
        @buy_shipping.user_id = nil
        @buy_shipping.valid?
        expect(@buy_shipping.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐づいていないと保存できないこと' do
        @buy_shipping.item_id = nil
        @buy_shipping.valid?
        expect(@buy_shipping.errors.full_messages).to include("Item can't be blank")
     end

    end
  end
end

