class UserBuy
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building, :phone_number, :history_id, :user_id, :item_id,
                :token, :item

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :house_number
    validates :phone_number, format: { with: /\A[0-9]{,11}+\z/i }
    validates :user_id
    validates :item_id
    validates :token
  end

  def save
    history = History.create(user_id: user_id, item_id: item_id)
    Destination.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number,
                       building: building, phone_number: phone_number, history_id: history.id)
  end
end
