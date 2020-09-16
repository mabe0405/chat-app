require 'rails_helper'

RSpec.describe Room, type: :model do
  before do
  @room = FactoryBot.build(:room) 
  end

  context "正常確認" do
    it "nameの値が存在すれば登録できること" do
      expect(@room).to be_valid
    end
  end

  context "異常確認" do
    it "nameが空では登録できないこと" do
      @room.name =""
      @room.valid?
      expect(@room.errors.full_messages).to include("Name can't be blank")
    end
  
  end
  
end
