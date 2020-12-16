class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping
  belongs_to :community
  belongs_to :send_out

  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :title
    validates :image
    validates :category_id
    validates :condition_id
    validates :shipping_id
    validates :send_out_id
    validates :community_id
    validates :explanation
  end

    validates :price, presence: true, format: {with: /\A[0-9a-zA-Z]+\z/i }, numericality: { only_integer: true,greater_than: 300, less_than: 9999999}

    validates :category_id, numericality: { other_than: 1 }
    validates :condition_id, numericality: { other_than: 1 }
    validates :shipping_id, numericality: { other_than: 1 }
    validates :send_out_id, numericality: { other_than: 1 }
    validates :community_id, numericality: { other_than: 1 }
end