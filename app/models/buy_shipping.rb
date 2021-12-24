class BuyShipping
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postal_code, :prefecture_id, :city, :house_num, :building, :tel_num, :buy_id, :token

  with_options presence: true do
    validates :postal_code  , format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}
    validates :city         
    validates :house_num    
    validates :tel_num      , format: {with: /\A\d{10}\z|\A\d{11}\z/}
    validates :user_id 
    validates :item_id 
    validates :token

  end

  def save
    buy = Buy.create(item_id: item_id, user_id: user_id)
    shipping = Shipping.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_num: house_num, building: building, tel_num: tel_num, buy_id: buy.id)
  end


end