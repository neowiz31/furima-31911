require 'rails_helper'

describe ItemOrder do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @item_order = FactoryBot.build(:item_order, item_id: item.id, user_id: user.id )
    sleep(1)
  end

  describe '商品購入手続き' do
    context '商品購入が成功する時' do
      it "全ての項目が入力されていれば登録できる" do
        expect(@item_order).to be_valid
      end

      it "建物名が空であっても登録できる" do
        @item_order.building_name =""
        expect(@item_order).to be_valid
      end
    end

    context '商品購入が失敗する時' do
      it 'postal_codeが存在しなければ登録できない' do
        @item_order.postal_code = ""
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Postal code can't be blank", "Postal code is invalid. Include hyphen(-)")
      end

      it 'postal_codeに「-」が無ければ登録できない' do
        @item_order.postal_code = "1234567"
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end

      it '都道府県が「---」では登録できない' do
        @item_order.prefecture_id = 1
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('Prefecture must be other than 1')
      end

      it '市区町村が存在しなければ登録できない' do
        @item_order.city = ""
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("City can't be blank")
      end

      it '番地が存在しなければ登録できない' do
        @item_order.house_number = ""
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("House number can't be blank")
      end

      it '電話番号が存在しなければ登録できない' do
        @item_order.phone_number = ""
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号が12桁を超えると登録できない' do
        @item_order.phone_number = "080123456789"
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Phone number is invalid")
      end

      it '電話番号が英数字混合では登録できない' do
        @item_order.phone_number = "0801234567a"
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Phone number is invalid")
      end
    end
  end
end