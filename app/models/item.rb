class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :title
    validates :image
    validates :price
    validates :category_id
    validates :condition_id
    validates :shipping_id
    validates :send_out_id
    validates :community_id
    validates :explanation
  end
end
